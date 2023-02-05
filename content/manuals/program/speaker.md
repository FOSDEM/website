---
title: FOSDEM Speakers Manual
---

Please help keeping this manual up to date, sources are [on github](https://github.com/FOSDEM/website/blob/master/content/manuals/program/speaker.md)!

Thank you to all speakers who
have put themselves forward to speak at this year’s FOSDEM.

As it’s a virtual event, all talks need to be pre-recorded by the speakers. This
is only the second time FOSDEM has operated in this way so please be aware that there
may be some bumps along the way - but it should be smoother than last year.

On the day your presentation is aired, you will be required to join an online
Matrix chatroom with delegates as they ask questions during your talk - further
details below. Afterwards, you will also be able to answer questions in a live
video conference room.

To make sure you, and anyone listening or asking questions, get the best out of
this event, here are some guidance notes to support your planning.

## Key dates

* Friday 20th January 2023, 2 weeks before FOSDEM
  All pre-recorded talks are expected to be uploaded by 20th January
  2023 to Pentabarf - the upload link should be available by the time you read
  this, if you don't have it, contact your devroom organiser. After this date,
  there is one week scheduled for you to review and if necessary, to re-upload to
  fix problems.

**Please do not plan to run right up against these deadlines - you and FOSDEM need
the contingency for things that genuinely go wrong.**

## Uploading your slides

Slides can be uploaded at  https://penta.fosdem.org/submission/FOSDEM23. Click on
"Events" in the left menu, select your own event, select "Files" tab, scroll down
to "Add attachment", choose "Slides", enable public preview and a name for the file
as well as the title, then choose your file and upload it.

## Recording your talk
You can use any tool that you prefer to record your
presentation. Open Broadcast Studio (OBS) is a powerful tool and recommended by
many speakers. Some useful documents here:

* [How to Use OBS Studio to Record or Stream Live
  Presentations](https://dev.to/erikaheidi/how-to-use-obs-studio-to-record-or-stream-live-presentations-474j)
* [FOSDEM 2021 : How to configure OBS to record your talk
  ](https://peertube.xwiki.com/videos/watch/c5cf50e3-2277-440a-b339-34874acd00b3)

Another option is to deliver your
presentation through a video conferencing platform to a colleague who can then
record the session. Either use the built-in recording of the conferencing
platform or ask your colleague to remotely record the presentation.

For example, you could use Jitsi to present your talk to a colleague, with
picture-in-picture mode so that the speaker is in the corner of the slides, and,
on Linux, use Simple Screen Recorder (SSR) to capture the talk in the
appropriate format.

Please bear in mind these tips for a good quality presentation:

* Test your recording process first to make sure both video and sound are captured
in the recording
* Make sure the video fits comfortably into your time slot -
FOSDEM is on a strict time schedule and you will be cut short if you over-run
* Don’t overload your slides. Make sure everything is readable when scaled down
slightly 
  * The 1280x720 video you send in may be scaled down to fit onto a FOSDEM
template
* Make sure you use a good microphone for your presentation, ideally a
headset
* Have a suitable background during recording and live Q&A
* Dress for the
occasion 

## Uploading videos
Videos should be uploaded to https://penta.fosdem.org/submission/FOSDEM23. Click on "Events" in the left menu, select your own event, select "General" tab, scroll down to "Pre-recorded Video Upload URL" and click on "Upload" text.

Technical requirements for your presentation video are:

* resolution: 1280x720
* frame rate: 25
* fps video codec: h264 video codec, main profile
* video bitrate: aim for 2Mbit/s
* audio codec: aac audio codec
* audio sample rate: 48 KHz mono
* audio bitrate: 128 Kbit/s
* media container: whatever is easiest for you
* maximum size of 2 GB

When you upload your video, the system will verify that it meets these requirements. If it does not, the video will be transcoded first (but this will take longer).

A 'review' link will be available so you can confirm that you have uploaded the
correct video.

If you want to change the video, you can overwrite by uploading a replacement.
However once you have confirmed the video, you can't upload it without FOSDEM
resetting your confirmation. This enables them to take control of last-minute
changes. A manual upload reset can be requested through video@fosdem.org. In any contact with the video team, please always mention your talk's event id from petabarf.

Bernard Tyers has [created a slide share showing exactly how the upload process
works](https://www.flickr.com/photos/runningwithbulls/50829935862/in/dateposted/).

The 'Review' link is not easy to find - look for the following dialogue box at the bottom of the [submission page](https://penta.fosdem.org/submission/FOSDEM22), and locate the review link:

![pentabarf review video link](assets/FOSDEM-Pentabarf-review-video-link.png)

Note that Duration is the proposed length of your session in the live stream
combining both pre-recorded talk and a short amount of live Q&A.

The presentation length is the length of the talk recording. This will be
updated to the exact length of the recording when the video is processed.

Extended Q&A will be offered through break-out rooms after the pre-recorded
video and Q&A are broadcast.

## Q&A sessions
Your Q&A session will follow your pre-recorded video. If your
timeslot is 10:00 - 10:30, for example, your video will be played out over the
stream from 10am. There will be an associated text chatroom where the speaker,
host and audience can talk. This means any questions can be answered directly
whilst the video plays.

When the video completes, for example at 21 minutes, 30 seconds, the live stream
will automatically switch over to a live video room with the speaker and speaker
host. The speaker host will lead a live Q&A/discussion on video, asking
questions that have been upvoted in the text chat or asking questions of their
own, clarifying anything that may not have been clear.

Just before the 10:30 close of the session, the live stream will end and if any
of the audience want to continue the Q&A/discussion, they will be directed to
the right place to go do that.

After the talk closes at 10:30, and the next one begins, you can continue with
your extended Q&A in a more open, informal fashion than during the session
itself.

## Real-time chat

The Matrix platform has been selected for the real-time organisers chat during the event. FOSDEM have [released an article explaining the rationale here](https://matrix.org/blog/2021/01/04/taking-fosdem-online-via-matrix). Note that there is also a bridge for IRC and XMPP / Jabber users.

If you are a devroom organiser / host / moderator, you will need to join the
chat through one of these connected channels on the day to process Q&A and
communicate with FOSDEM staff.

Hosts and coordinators All speakers must ensure they have a host and a
coordinator to support their talk.

The coordinator is the devroom manager and the host will work with the speaker
to ensure they upload a suitable presentation, as well as host the live Q&A
session. Hosts only need a normal self-created pentabarf account, like a speaker
(not a devroom manager). Adding them to the event with the ‘host’ role gives
them access to what they need.

Speakers, devroom managers and hosts can see the events you are listed against
at the [‘Own Events’](https://penta.fosdem.org/event/own) link and upload videos [will be available here](https://penta.fosdem.org/submission/FOSDEM23/events).

Please make sure that hosts and coordinators are not taking part in a talk
before or after your own – otherwise there could be problems with overlap during
Q&A sessions outside of the presentation time. Remember, your Q&A can continue
in a separate live video conference after your talk has ended.

## Further support
* [FOSDEM matrix channel](https://chat.fosdem.org/#/room/#fosdem:matrix.org)
* [#fosdem on Libera.Chat](ircs://irc.libera.chat:6697/fosdem)
* contact FOSDEM at speakers@fosdem.org


## Final words
This manual is based on a [news post](https://news.perlfoundation.org/post/fosdem_2021_speaker_guidance) by the Perl devroom organisers of 2021.
We encourage anyone to improve this text: sources are [on github](https://github.com/FOSDEM/website/blob/master/content/manuals/program/speaker.md)!
