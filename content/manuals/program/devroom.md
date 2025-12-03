---
title: Devroom Managers Manual
---

Please help keeping this manual up to date, sources are [on github](https://github.com/FOSDEM/website/blob/master/content/manuals/program/devroom.md)!

## Key dates


* 12 October: deadline for developer room proposals
* 26 October: accepted developer rooms announced
* 7 November (or earlier): developer rooms issue Calls for Participation
* 15 December (or earlier): developer rooms publish complete schedules

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
alias expansions also include [devrooms@fosdem.org](mailto:devrooms@fosdem.org).
Again, please make sure you read those messages.
A list of mail aliases can be found in [pretalx](https://pretalx.fosdem.org/orga/event/fosdem-2026/p/devroom-report/)
(this list is only accessible to devroom managers), so you can contact other devrooms, eg for moving talks to another room.

Thirdly, we can create additional mailing lists for devrooms to use
either for a wider team of organisers or for visitors and these may
be public or private. Contact [devrooms@fosdem.org](mailto:devrooms@fosdem.org) for this.

## Devroom managers

Each devroom needs to send to [devrooms@fosdem.org](mailto:devrooms@fosdem.org) the list of the of email adresses for any room organisers who need to be granted access. Note that is for full access including scheduling later in the conference. 

Devrooms managers list can be tracked on the [devroom managers report](https://pretalx.fosdem.org/orga/event/fosdem-2026/p/devroom-report/).
We request every devroom to have two people in this list, to make sure there is a backup in case of issues.
Devroom managers status grant access to:

- devroom mailing list
- talk review
- talk scheduling
- room full + video control (during the event)
- video review (after the event)

People who only review should not be made devroom manager: you can add them to a review team on your [devroom dashboard](https://pretalx.fosdem.org/orga/event/fosdem-2026/p/devroom-dashboard/).

## Before the event

### Call for Participation / call for papers

Devrooms issue a Call for Papers.

* Note the deadline: November 7.
* Send a copy to the [FOSDEM mailing list](https://lists.fosdem.org/listinfo/fosdem). Note that this is a moderated list, it may take up to a day before your messages is reviewed.
* CfP will be added to the accepted developer rooms.
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
[https://pretalx.fosdem.org/orga/event/fosdem-2026/](https://pretalx.fosdem.org/orga/event/fosdem-2026/)

### Adding a devroom description to the website

Optionally you can add a small description of the devroom on top of the page. See the example at [https://archive.fosdem.org/2020/schedule/track/security/](https://archive.fosdem.org/2020/schedule/track/security/).

Add a .html file in the [website/content/schedule/devrooms/](https://github.com/FOSDEM/website/tree/master/content/schedule/devrooms) folder in the git repo for this description. Keep it concise.

### Closing your call for papers

Because different devrooms have different deadlines, and some tracks such as BOF stay open until the end of the conference there is no general deadline.
When you want to close your call for papers, you should activate "require access code" in the devroom dashboard.

![Devroom dashboard showing require access code](img/require_access_code.png)

### Reviewing talks

* Reviewing talks can happen from the [review](https://pretalx.fosdem.org/orga/event/fosdem-2026/reviews/) page. By default devroom managers will see all proposals, also for other tracks. If you only want to review tracks for which you are a manager or review team member, click the large info box on top of the page.

![Review page](img/review.png)

In addition to devroom managers, you can invite extra reviewers for your track by using the [devroom dashboard](https://pretalx.fosdem.org/orga/event/fosdem-2026/p/devroom-dashboard/). Note invited members have to open the link in the mail they receive in order to get access. As an alternative, you can send them the link next to their invitiation also using any other way.

Note that devroom managers are able to review also proposals in other tracks. This to spot talks which might be better suited for your devroom or to spot people who submit the same talk to different tracks.

### Accepting and Rejecting talks

After the review phase a selection of talks must be made from the [proposals](https://pretalx.fosdem.org/orga/event/fosdem-2026/submissions/) page. 
When accepting or rejecting a talk, a mail will be generated in the outbox in the bottom left. Please review these mails quickly: it will be confusing for other devroom managers if mails are stuck there. You can edit the mails if you want to add some personalised content or discard them if you inform speakers another way (this is not recommended). In any case, leave the reply-to address to that of the devroom team, so questions get to the track organisers.

![send/edit/discard mails](img/send-edit-mail.png)

In the image above the highlighted buttons on the right allow send/edit/discard mails.


You can also mark a decision on accept/reject as pending. In that case the submitter will not see a change in status if they log in. 

You can also change the duration of the talk when accepting it. This will make the next step (scheduling) somewhat easier.

### Scheduling talks

After a talk has been accepted it can be scheduled. The easiest way to do this is by going to the [schedule](https://pretalx.fosdem.org/orga/event/fosdem-2026/schedule/) page. Choose your track on the top left dropdown and your assigned room in the bottom right (check the mailing list archive if in doubt).

![schedule editor](img/schedule.png)

You can now drag and drop your talk to the schedule. By default the schedule will show the time in 30 minute granularity, but you can click on the time bar to make this 5 minutes. After a talk was added to the schedule, you can adjust it duration by double clicking it. Take care for any warning in the editor.

After you finish scheduling, click the Check bottom in the top right. If this page mentions any errors concerning your track, please review them and fix them. As long as errors are mentioned, no new schedule will be released. If there are no errors, releases of the schedule will be generated automatically and are picked up by the FOSDEM website/apps/.... Only talks which are _confirmed_ will be shown.

Alternatively, if the scheduling interface does not work for you, you can manually add start and stop times and a room to proposals. Note that there is a larger chance to make error if you use this method.

Reminder, the hours where devrooms can be scheduled are:

* Sat 10.30-14.30  15.00-19.00
* Sun 09.00-12.45  13.15-17.00

The break should only be scheduled when a change of devroom happens. If the devroom is scheduled for a whole day, don't schedule a break. 

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
  anyway and have the details ready in pretalx so you can swap them in
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
    to make sure the videos are tagged correctly.

#### Website schedule

The website is generated from the data in pretalx.
This runs automatically every few minutes.

You can see when it was last updated near the bottom of 
[the events page](https://fosdem.org/2026/schedule/events/).

Note that the data gets pulled from the database slightly before
this timestamp is generated - sometimes a few minutes before.
If nothing on this page changed, the date won't be updated.
[https://fosdem.org/2026/sitemap.xml](https://fosdem.org/2026/sitemap.xml) shows the last modified
date for every page on the site.

If the system detects an inconsistency in the data, it stops
updating the site until this is corrected in the database.

#### Troubleshooting

* to be updated for pretalx


