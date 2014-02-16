# vim: set ts=2 sw=2 et ai ft=eruby:
# encoding: UTF-8

module Fosdem
  module Pdf
    private

    $PDF_FONT = 'DejaVuSansCondensed'
    $PDF_TIME_FONT = 'DejaVuSansMono'
    $PDF_TIME_COLOR = '444444'
    $PDF_HEADING_FONT = 'Delicious'
    $PDF_EMPTY_CELL_COLOR = 'EEEEEE'
    $PDF_ROOM_CELL_COLOR = 'DDDDDD'

    $PARAMS = {
      a4: {
        page_size: 'A4',
        cell_text_length_threshold: 20,
        rooms_per_page: 8,
        rows_per_page: 40,
        font_size: 8,
      },
      a3: {
        page_size: 'A3',
        cell_text_length_threshold: 20,
        rooms_per_page: 12,
        rows_per_page: 57,
        font_size: 8,
      },
    }

    public
    def self.pdf_grid(size)
      params = $PARAMS[size]
      raise "invalid size: must be one of [#{$PARAMS.keys.join(", ")}]" unless params

      require 'prawn'

      Prawn::Document.new(
        page_size: params.fetch(:page_size),
        page_layout: :landscape,
        info: {
        Title: "#{conference()[:title]} Schedule",
        Author: "fosdem.org",
        Subject: "FOSDEM",
      }) do

        font_families.update(
          'DejaVuSansCondensed' => {
          normal: File.join('pdf', 'DejaVuSansCondensed.ttf'),
          bold:   File.join('pdf', 'DejaVuSansCondensed-Bold.ttf'),
        },
        'DejaVuSansMono' => {
          normal: File.join('pdf', 'DejaVuSansMono.ttf'),
        },
        'Delicious' => {
          normal: File.join('pdf', 'Delicious-Bold.ttf'),
          bold:   File.join('pdf', 'Delicious-Heavy.ttf'),
        },
        )
        font($PDF_FONT)

        sections = []
        page = 0

        day_grids = begin
                      h = {}

                      $timetable.each do |d, source|
                        rooms = begin
                                  by_time = source.fetch(:by_time)
                                  if by_time.empty?
                                    []
                                  else
                                    by_time.fetch(by_time.keys.first).keys
                                  end
                                end

                        grids = begin
                                  matrix = []
                                  source.fetch(:by_room).each_slice(params.fetch(:rooms_per_page)) do |slice|
                                    by_rooms = slice.map{|a| Hash[*a]}
                                    matrix << Fosdem::Pdf::build_grids(by_rooms, params.fetch(:rows_per_page), params.fetch(:cell_text_length_threshold))
                                  end
                                  flipped_grid = []
                                  matrix.each_with_index do |row, i|
                                    row.each_with_index do |cell, j|
                                      flipped_grid[j] = [] unless flipped_grid[j]
                                      flipped_grid[j][i] = cell
                                    end
                                  end
                                  grids = []
                                  flipped_grid.each do |row|
                                    row.each do |cell|
                                      grids << cell
                                    end
                                  end
                                  grids
                                end

                        h[d] = grids
                      end

                      h
                    end

        total_pages = day_grids.values.map(&:size).inject(:+)
        total_page = 0
        sections = begin
                     sections = {}
                     day_grids.each do |d, grids|
                       page = 0
                       pages = grids.size
                       sections[d] = (total_page + 1)
                       grids.each do |grid|
                         page += 1
                         total_page += 1

                         day = day(d)
                         font($PDF_HEADING_FONT) do
                           text "#{conference()[:title]} - #{day[:title]} #{day[:conference_day]} (#{page}/#{pages})"
                         end

                         column_width = ((margin_box.width - 30) / params.fetch(:rooms_per_page)).to_i
                         table(
                           grid,
                           header: true,
                           column_widths: [30] + ([column_width] * params.fetch(:rooms_per_page)),
                           cell_style: {
                             size: params.fetch(:font_size),
                             overflow: :shrink_to_fit,
                             min_font_size: 6,
                             padding: [1, 2],
                           }
                         )
                         start_new_page unless total_page == total_pages
                       end
                     end
                     sections
                   end

        outline.define do
          section "Schedule" do
            sections.each do |d, page|
              page(title: day(d)[:title], destination: page)
            end
          end
        end
      end.render
    end

    private

    def self.build_grids(by_rooms, rows_per_page, cell_text_length_threshold)
      grid = begin
               rows = []
               Hash[*by_rooms.first.values].keys.map do |time|
                 t = if time.split(':').last.to_i % 15 == 0
                       { content: time, size: 6, single_line: true, text_color: $PDF_TIME_COLOR, valign: :top, font: $PDF_TIME_FONT }
                     else
                       { content: ' ', size: 6 }
                     end
                 rows << [t]
               end
               rows
             end

      header = ['']

      col = 1
      by_rooms.map(&:first).each do |room_slug, timeline|
        header[col] = room(room_slug)[:title]

        row = 0
        last_rowspan = nil
        since_last_rowspan = 0
        timeline.each do |time, events|
          event = events.first
          if event
            if event[:state] == :begin
              last_rowspan = event[:slots]
              since_last_rowspan = 0
              grid[row][col] = { content: event[:title], rowspan: event[:slots] }
              row += 1
            else
              since_last_rowspan += 1
              grid[row][col] = { content: "\u{21B3} #{event[:title]}", rowspan: last_rowspan - since_last_rowspan, continued: true }
              row += 1
            end
          else
            grid[row][col] = { content: ' ', background_color: $PDF_EMPTY_CELL_COLOR }
            row += 1
          end
        end
        col += 1
      end

      # postprocess header
      header = begin
                 col = 0
                 header.map do |text|
                   cell = { content: text, border_width: 2, align: :center, valign: :top }
                   if col == 0
                     cell[:borders] = [:bottom, :right]
                   else
                     cell[:borders] = [:bottom, :right, :top]
                     cell[:background_color] = $PDF_ROOM_CELL_COLOR
                     cell[:font_style] = :bold
                     cell[:size] = 10
                   end
                   col += 1
                   cell
                 end
               end

      # split grid per page
      grids = begin
                list = []
                grid.each_slice(rows_per_page).each do |rows|
                  new_grid = []
                  new_grid << header

                  rows.each_with_index do |row, r|
                    new_row = []
                    row.each do |cell|
                      if cell and cell[:rowspan]
                        if r + cell[:rowspan] > rows_per_page
                          cell.delete :continued if cell.has_key?(:continued) and r == 0
                          cell[:rowspan] = rows_per_page - r
                          cell[:content] = "#{cell[:content]} \u{21B4}"
                          new_row << cell
                        else
                          cell.delete :continued if cell.has_key?(:continued) and r == 0
                          new_row << cell
                        end
                      else
                        new_row << cell
                      end #if
                    end #cell
                    new_grid << new_row
                  end #row
                  list << new_grid
                end #rows
                list
              end #grids

      grids.map do |g|

        g = g.map do |row|
          row.map do |cell|
            if cell.is_a? Hash and cell.has_key? :content and (cell[:content].size / cell.fetch(:rowspan, 1)) > cell_text_length_threshold
              cell[:content] = "#{cell[:content][0..(cell.fetch(:rowspan, 1) * cell_text_length_threshold)]}\u{2026}"
            end
            cell
          end
        end

        # compress by removing nil cells
        g = g.map do |row|
          row.reject{|cell| cell.nil? or (cell.is_a? Hash and cell[:continued])}
        end

        g
      end
    end

  end #Pdf
end #Fosdem

