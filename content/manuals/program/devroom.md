---
title: Devroom Managers Manual
---

Please help keeping this manual up to date, sources are [on github](https://github.com/FOSDEM/website/blob/master/content/manuals/program/devroom.md)!

## Key dates

* 16 October - deadline for developer room proposals
* 12 November - developer rooms issue Call for Participation
* 15 December - developer rooms publish complete schedules

## Devroom expectations

## Communication

FOSDEM uses the devroom-manager mailing list for communications with the
people who are organising devrooms.  Please make sure you read this
list and keep the messages for reference.

The FOSDEM Devrooms team can be contacted using [devrooms@fosdem.org](mailto:devrooms@fosdem.org).
Please try to remember to send individual requests to that address and
keep this devroom-manager mailing list for messages and discussion that
may be of interest to other devrooms.

Secondly, we create mail aliases &lt;room&gt;-devroom-manager@fosdem.org that
provide a convenient way for us to contact each other, for example
to discuss moving proposed talks between devrooms.  Note that these
alias expansions also include devrooms@fosdem.org.
Again, please make sure you read those messages.

A list of mail aliases can be found in [pretalx](https://pretalx.fosdem.org/orga/event/fosdem-2024/p/devroom-report/)
(this list is only accessible to devroom managers), so you can contact other devrooms, eg for moving talks to another room.

Thirdly, we can create additional mailing lists for devrooms to use
either for a wider team of organisers or for visitors and these may
be public or private. Contact devrooms@fosdem.org for this.

## Devroom managers

Each devroom needs to send to [devrooms@fosdem.org](mailto:devrooms@fosdem.org) the list of the of email adresses for any room organisers who need to be granted access. Note that is for full access including scheduling later in the conference. 

Devrooms managers list can be tracked on the [devroom managers report](https://pretalx.fosdem.org/orga/event/fosdem-2024/p/devroom-report/).
We request every devroom to have two people in this list, to make sure there is a backup in case of issues.
Devroom managers status grant access to:

- devroom mailing list
- talk review
- talk scheduling
- room full + video control (during the event)
- video review (after the event)

Note we plan to provide a tool to add reviewers for your track soon, which would allow you to self-service reviewers for your track. People who only review should not be made devroom manager.

## Before the event

### Call for Participation / call for papers

Devrooms  issue a Call for Papers.

* Note the deadline: November 12
* Send a copy to the [FOSDEM mailing list](https://lists.fosdem.org/listinfo/fosdem)
* CfP will appear on the accepted developer rooms announcement as soon as it is published
* Browse examples from previous years if you need inspiration: 
  * [2021](https://archive.fosdem.org/2021/news/2020-12-06-accepted-developer-rooms/)
  * [2022](https://archive.fosdem.org/2022/news/2021-11-30-accepted-developer-rooms/)
  * [2023](https://fosdem.org/2023/news/2022-11-07-accepted-developer-rooms/)

If you wish, you can ask for review on the devroom-manager list before publication or on devrooms at fosdem.org.

We can also make adjustments to the names of devrooms at this early
stage - particularly if related proposals got combined or you want
to emphasise some little change of focus.

Full details of all talks and speakers that you schedule must be
submitted into our 'pretalx' database which is used to generate our
website and schedules no later then <b>15th December</b>.  Please try to complete this 
earlier. It is better to find out scheduling conflicts early, and by the end of 
December it is hard to reach people. By running late, you also give
your presenters less work to prepare their talks.
    
All submissions must go through pretalx:
      [https://fosdem.org/submit](https://fosdem.org/submit)

Note that this is a new system and accounts from pentabarf were not migrated: Presenters will have to create a new account.

Staff and devroom managers can access the submitted content through the organisers site which sits at:
https://pretalx.fosdem.org/orga/event/fosdem-2024/

### Adding a devroom description to the website

Optionally you can add a small description of the devroom on top of the page. See the example at [https://archive.fosdem.org/2020/schedule/track/security/](https://archive.fosdem.org/2020/schedule/track/security/).

Add a .html file in the [website/content/schedule/devrooms/](https://github.com/FOSDEM/website/tree/master/content/schedule/devrooms) folder in the git repo for this description. Keep it concise.

*NOTE: this is not yet operational for 2024.*

### Reviewing talks

* Needs update to pretalx

### Scheduling talks

* Needs update to pretalx
* Scheduling can only start if the devrooms have been assigned their room


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

The website is generated from the data in pretalx.
This runs automatically every few minutes.

You can see when it was last updated near the bottom of 
[the events page](https://fosdem.org/2024/schedule/events/).

Note that the data gets pulled from the database slightly before
this timestamp is generated - sometimes a few minutes before.
If nothing on this page changed, the date won't be updated.
https://fosdem.org/2023/sitemap.xml shows the last modified
date for every page on the site.

If the system detects an inconsistency in the data, it stops
updating the site until this is corrected in the database.

#### Troubleshooting

* to be updated for pretalx


