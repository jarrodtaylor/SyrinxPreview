---
title: Best Way to Deliver Video Via Android and iOS
description: How to best deliver video content through either Android or iOS apps? There are a number of options and best practices for apps on both platforms.
archive_title: The best strategy for delivering video content via Android and iOS
---

# Best Way to Deliver Video Via Android and iOS


It's not surprising that video content is incredibly popular. What may be surprising, though, is just how popular video has become. According to a recent study from Cisco Systems,  video traffic accounted for more than three-fourths of all Internet bandwidth consumed in the U.S. in 2014. By 2018, this number will likely reach 84 percent. 

With that in mind, it's easy to see why so many companies are eager to incorporate video content into their applications. Video can be a fantastic resource to make your applications more engaging and dynamic. Of course, this raises the question of how to best deliver video content through either Android or iOS apps. There are a number of options and best practices for apps on both platforms.

**Video for Android apps**  
Arguably the best option for video content delivery for Android apps centers on the Android multimedia framework. As the name suggests, the Android multimedia framework supports not just video, but audio and images as well, making integration of all these media types fairly straightforward. With the Android multimedia framework, apps can play video from three different sources:

  * Media files stored in the application's resources
  * Data streaming over a network connection
  * Standalone files in the file​ system

In all of these cases, the MediaPlayer should serve as the primary API. MediaPlayer can support local resources, along with both internal and external URLs. 

![Video can make an app more dynamic and engaging.](http://pictures.brafton.com/x_0_0_0_14106262_800.jpg)Video can make an app more dynamic and engaging.

All of this is fairly straightforward, but becomes somewhat more complicated when it comes to execution. For example, the official Android Developers resource notes that [the call to prepare() may be time-consuming](http://developer.android.com/guide/topics/media/mediaplayer.html) as a result of the necessary fetching and decoding of media data. This makes it essential to avoid calling for executing this action from the app's user interface thread.

This is just one of the many missteps that could potentially undermine video content delivery efforts via Android apps. To ensure high-quality performance, as well as reliability and security, a careful approach is essential.

_"To ensure high-quality performance, as well as reliability and security, a careful approach is essential."_

**Video for iOS apps**  
When it comes to video content delivery for iOS apps, there are a number of options available to developers. First and foremost, it's important to consider the AV Foundation framework and AVKit framework.

The AV Foundation framework offers a set of Objective-C classes for managing, recording and playing both audio and video content and then integrating these capabilities into the app's user interface. This framework also supports video streaming over AirPlay.

The AVKit framework is used to manage the presentation of video that already exists in the AV Foundation framework. The AVKit framework therefore effectively replaces the Media Player framework, which is better suited for purely audio delivery.

Additionally, anyone aiming to deliver video content through an iOS app should also consider YouTube Helper. YouTube Helper is an open source library that creates a bridge between iOS applications' Objective-C code and YouTube's JavaScript code. This means the iOS developer can gain control over the YouTube player. However, it's important to note that there are certain limitations inherent to this practice. Notably, the player [cannot play private videos](https://developers.google.com/youtube/v3/guides/ios_youtube_helper#best_practices), and it also does not support concurrent video playback in multiple YTPlayerView instances, as the Google Developers resource guide explained.

**Best practices**  
As this guide has demonstrated, it is very possible to incorporate video delivery into apps on either Android or iOS platforms. But actually delivering this level of performance is easier said than done. To avoid the myriad potential problems that may arise, organizations should strongly consider partnering with a third-party mobile application development firm that can offer a high level of expertise and experience. These consultants can ensure that the development of apps including video content proceeds smoothly, quickly and safely.
