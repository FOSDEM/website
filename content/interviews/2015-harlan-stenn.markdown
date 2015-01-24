---
year: 2015
speaker: harlan_stenn 
event: ntf_s_general_timestamp_api_and_library 
---

Q: Could you briefly introduce yourself? 

I remember V7 Unix, and PDP-11s.  I started writing really portable C
code, and using Perl's metaconfig package for this (before GNU
Autoconf).  I sent enough patches in to Larry Wall that I ended up being
responsible for the 2.0 release of metaconfig.  Did a lot of development
and sysadmin work with heterogeneous Unix boxes, which led to using NFS
a lot, which led to the need for accurate time on those machines.  So I
started submitting portability and bugfix patches to [NTP](http://ntp.org/).  By the middle
of 1996 I was doing a lot of work on the NTP Project.

Q: What will your talk be about, exactly? Why is this topic important? 

Timestamps haven't changed all that much in a very long time, but we use
them, more and more.  Having worked with manufacturing inventory and
accounting systems, medical records and clinical laboratory systems,
radiology systems, and various SCADA and other logging systems, I've
kept notice of what has worked and what hasn't.

Increasingly more often, timestamps acquired in one area must be
referenced or sequenced with timestamps in other areas.  With the sort
of timestamps we currently use, this simply cannot be done well.

Q: So what information is missing in current timestamps and what problems does this cause? 

A partial list includes:

 * the timescale being used
 * any known pending correction to the correct time
 * the error bounds on the timestamp

Not knowing these things makes it very difficult to sequence events.  It
can be expensive and inefficient for all involved.  In a medical care
setting, think of what could "go wrong" or how much time and money is
wasted if the timestamps for different events are inaccurate, and
attorneys (in the US, at least!) start getting involved.

Look at what happened in the North American Northeast power blackout of
2003 - it was basically impossible to properly sequence the failure
order at other than coarse-grained levels, as there were thousands of
devices logging events with inconsistent time.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Increased awareness, interest, participation, and support for the effort.

Q: What's the history of the General Timestamp API Project? Why did you start it? How did it evolve? Has it become what you planned it to be? 

I started thinking about it several years ago, when I realized that so
many of the problems I was seeing trying to accomplish various event
reconciliations were because the timestamps sucked.

I remembered the days when a 32- or 64-bit timestamp was considered
fairly "big".  Unix timestamps haven't changed all that much since the
1970s, when *megabytes* of data was a lot.

And what about the timestamps in SQL databases?  How long have they looked
like that?

I started looking at what would be needed in a timestamp to provide
useful information at the application layer, and very quickly decided
that for these timestamps to be useful we'd need to have kernel
timekeeping support as well.  I made some notes.  Then [Google Summer of Code 2013](https://www.google-melange.com/gsoc/homepage/google/gsoc2013) came
around, and the project selected by one very interesting student fell
through - we needed to find another project for him to work on.  I
mentioned some, including the GTSAPI project, and he was *very*
interested in that.  So I wrote up more and we started working on the
effort, a [user-level library API](http://wiki.nwtime.org/GSoC/GSoC2013NewTimestampAndAPI) and some effort into implementing this
type of timestamp as a core timekeeping structure in a Linux kernel.

Since then, not much has happened - we just don't have the people or
funds to actively develop the project.  I'd *love* to work on this
full-time, but I've got both NTP and [NTF](http://nwtime.org/) work that takes precedence.

If we can get sufficient folks to volunteer and raise some dollars, we can
make good progress with the project.

Q: Is the GTSAPI already usable for application developers? What functionality does it currently have? 

We have a basic proof-of-concept library.  The actual GTSAPI "structure"
still needs some updating.  There are some new ideas about how to handle
UTC leap seconds that will be better than what we've currently done.
Similarly, we need to take a stronger look at optional elements of the
structure, including digital signatures.

Q: How can interested time nuts help the GTSAPI project? 

We need some funding and/or bodies.  If we only get funding, I can hire
people to work on this.  If we get enough people, we can do this with
less funding.  Note that "people" includes project participants as well
as sysadmin help (mailing list, website, etc.)

Q: Have you enjoyed previous FOSDEM editions? 

I'll look and let you know :)
