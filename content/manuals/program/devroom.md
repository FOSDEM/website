---
title: Devroom Managers Manual
---

Please help keeping this manual up to date, sources are [on github](https://github.com/FOSDEM/website/blob/master/content/manuals/program/devroom.md)!

## Key dates

* 31 October - deadline for developer room proposals
* 12 December - developer rooms publish Calls for Participation
* 31 December - developer rooms publish complete schedules

## Devroom expectations

To be updated for the 2022 online event

## Communication

FOSDEM uses the devroom-manager mailing list for communications with the
people who are organising devrooms.  Please make sure you read this
list and keep the messages for reference.

The FOSDEM Devrooms team can be contacted using devrooms@fosdem.org.
Please try to remember to send individual requests to that address and
keep this devroom-manager mailing list for messages and discussion that
may be of interest to other devrooms.

Secondly, we create mail aliases &lt;room&gt;-devroom-manager@fosdem.org that
provide a convenient way for us to contact each other, for example
to discuss moving proposed talks between devrooms.  Note that these
alias expansions also include devrooms@fosdem.org.
Again, please make sure you read those messages.

Thirdly, we can create additional mailing lists for devrooms to use
either for a wider team of organisers or for visitors and these may
be public or private.

## Devroom managers

Each devroom needs to send to [devrooms@fosdem.org](https://lists.fosdem.org/listinfo/devrooms) the list of the
pentabarf account names of any room organisers who need to be granted access.

Devrooms managers list can be track on the devroom managers report: https://penta.fosdem.org/report/devroom_managers

Devroom managers status grant access to:

- devroom mailing list
- talk review
- talk moderation during live online event

## Before the event

### Call for Participation / call for papers

Devrooms  issue a Call for Papers.

* Note the deadline: 12/12
* Send a copy to the [FOSDEM mailing list](https://lists.fosdem.org/listinfo/fosdem)
* CfP will appear on the [accepted developer rooms](https://fosdem.org/2022/news/2021-11-30-accepted-developer-rooms/) announcement 
* Browse examples from previous years if you need inspiration: [2021](https://fosdem.org/2021/news/2020-12-06-accepted-developer-rooms/). If you wish, you can ask for review  on the devroom-manager list before publication or on devrooms at fosdem.org.

We can also make adjustments to the names of devrooms at this early
stage - particularly if related proposals got combined or you want
to emphasise some little change of focus.

Full details of all talks and speakers that you schedule must be
submitted into our 'pentabarf' database which is used to generate our
website no later then <b>31th December</b>.  Please try to complete this 
earlier. It is better to find out scheduling conflicts early, and by the end of 
december it is hard to reach people. By running late, you also give
your presenters less work to prepare their talks.
    
All submissions must go through:
      https://penta.fosdem.org/submission/FOSDEM22
      
Remind speakers that if they already have an account from a previous year
they should reuse it.  (Our website links speakers to all their talks
across all the years of FOSDEM.)  Then you can use the system to review
and select talks, and transfer them between devrooms if appropriate.

### Reviewing talks

https://penta.fosdem.org/report/review/

Use this to view and review proposals assigned to your devroom track.
You can add ratings and remarks in the <b>Rating</b> tab. These will not be accessible to the speaker.


Use these fields for your workflow:

  * Event state
  * Progress
  * Notes
    
Ultimately, all 'events' in your devroom track either need to be rejected, or accepted and (re)confirmed. Obviously, don't change the state of events in other tracks.

Please don't change the tracks assigned to any Main Track / Keynote /
Lightning Talks at this stage as we have not reviewed them yet and it's
only fair that we consider them under the track that the submitter
selected before considering transferring them to a different track.

(And we won't object if any of you help us out by adding your own review
comments or scores to events in these tracks as long as you are being
reasonably objective and not just giving your friends' talks top scores!)


### Scheduling talks


#### Scheduling in Pentabarf
To schedule a task in pentabarf you have to:

 *  In the **general tab**:
     * Make sure **event state** is "accepted"
     * Set a unique **slug**

       Please set the 'Slug' to a unique memorable
       string (without spaces or non-ASCII characters) based on the title of
       the event.  The URL generated for the event is then:
       https://fosdem.org/2022/schedule/event/&lt;<b>slug</b>&gt;/<br>
       To group things to together nicely, you could put the same devroom
       prefix on them all, e.g.
         https://fosdem.org/2021/schedule/event/ada_.../
      * Set the <b>progress</b> to "confirmed" or "reconfirmed" if you want it to appear on the website.
  * In the <b>schedule</b> tab:
      * Set Day, start time, duration and room.
      * Make sure Public event is checked

While going through all proposal it is also worth checking their content:

 * In the <b>persons</b> tab
    * Make sure the authors full name is present. There's also some understandable confusion about the name fields.
        * The 'Public Name' field should normally be left blank, and then
          "Firstname Lastname" is generated automatically.
        * To show a person's nickname, set the Public Name field to
          "Firstname Lastname (Nickname)".
                   
      Unfortunately, the form Firstname "Nickname" Lastname is not currently supported by the code. 

    * Only in rare cases will we hide the speaker's real name - e.g. if their
      real name and nickname are not yet connected when you search the internet.
                   
    * If a talk is presented by more than one author, you can add an extra speaker here (they must create a pentabarf account).

 * In the <b>description</b> tab:
    * Make sure the abstract is not duplicated in the full description - both are concatenated. It is okay to leave the full description empty.
    * Make sure the title is short and stands on its own. Long titles will get truncated in the booklet/apps

<h4>Inform your speakers</h4>
<ul>
  <li>
    Keep in mind that pentabarf does not send automatical emails. You have to inform your speakers yourself. Note that you can use <a href="https://github.com/meyskens/penta-export">this utility</a> provided by the Go devroom managers (thanks!) to get an export of all talks of your track with contact details of the speakers. 
  </li>
  <li>
    Encourage your speakers to upload photographs and to
    write short biographies.  If you add a speaker to the system yourself,
    make sure you include a contact email address.
  </li>
</ul>

#### Scheduling hints

* For the main tracks we change over on the hour and there we suggest the
  speakers talk for about 45 minutes, with 5 minutes of questions.  That
  gives us a 10-minute buffer for changeover and means a slightly-late
  finishing talk shouldn't prevent the next talk from starting on time.
* Related / nearby devrooms should consider synchronising their time-slots
  to reduce the disruption as people move around.

* If your speakers are travelling long-distance and you're not sure whether
  or not they're arriving a day or two early, schedule them later in the
  day in case their journey is delayed.
  Similarly, consider the home time-zone of speakers when scheduling
  and allow for jet-lag.

* Keep a couple of talks in reserve in case speakers drop out at the last
  minute.  Choose these from speakers you know will be attending the event
  anyway and have the details in pentabarf ready so you can swap them in
  with very little effort if you need to do so.

* If you spot a rejected talk in the system that you are interested in, please
  be aware that the proposer might not yet know his talk was rejected. Contact 
  the original devroom manager proposer to see if you can move it to your devroom,
  and only contact the presenter afterwards.

  The easiest workflow is to change the track and change the status back
  from rejected.
  If you do this, add a note in the Notes box at the top to say what you
  did (with username and date).
  e.g. "Moved from Main Tracks to Lightning Talks - agk, 2016/12/10"
* So some of the lightning talks are in the PB system.  How would we
  schedule these?  It seems crazy to create a bunch of 5-minute slots.

  * That's not crazy at all.  Please do this.
    The video information gets generated from this, so it's the simplest way
    to make sure the videos are tagged correctly. It would help for the booklets that the titles are very short. 

#### Website schedule

The website is generated from the data in pentabarf.
This runs automatically every few minutes.

You can see when it was last updated near the bottom of 
[the events page](https://fosdem.org/2022/schedule/events/).

Note that the data gets pulled from the database slightly before
this timestamp is generated - sometimes a few minutes before.
If nothing on this page changed, the date won't be updated.
https://fosdem.org/2022/sitemap.xml shows the last modified
date for every page on the site.

If the system detects an inconsistency in the data, it stops
updating the site until this is corrected in the database.

#### Troubleshooting

Pentabarf still does not detect if a speaker has been allocated two 
slots that
overlap so do watch out for that!


* "Event with incorrectly named tag"?
   You've perhaps got some invalid characters in the slug?
   First one I looked at with that message had spaces in it which I
   removed.
   Don't put '?' in a slug.

* Event with missing unique tag (slug)

  Make sure you use a valid [SLUG](#scheduling-in-pentabarf).

## Last weeks before the event

To be adjusted for the online event
