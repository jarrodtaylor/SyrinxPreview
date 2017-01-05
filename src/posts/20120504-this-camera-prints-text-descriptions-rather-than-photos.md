---
title: Camera Prints Text Descriptions Rather Than Photos
description: NYU student and technologist Matt Richardson was able to construct an actual camera that prints text descriptions rather than photos.
archive_title: This camera prints text descriptions rather than photos
link: http://blogs.syrinx.com/uncategorized/this-camera-prints-text-descriptions-rather-than-photos/
---

# Camera Prints Text Descriptions Rather Than Photos

There is a humorous parody account on Twitter by the handle [@textinstagram](https://twitter.com/#!/textinstagram) which posts the usual suspects that you'd find on your Instagram feed, but in text form. Some gems among them are "Deadpan stare, no filter", "Airplane wing as viewed from two seats back", and the simple yet effective, "Feet".

![Descriptive Camera](/assets/img/blog/descriptive-camera.jpg)

Believe it or not, NYU student and technologist Matt Richardson was able to construct an actual camera that essentially does just that.

The hardware powering the camera consists of [BeagleBone](http://beagleboard.org/bone), which is an embedded Linux platform developed by Texas Instruments, connected to a basic webcam, a printer, a shutter button, and three LED status lights. These are all brought together using a few Python scripts to handle the basic operations.

Richardson explains that by compiling descriptions of photos, we'll be able to better organize the flood of data that is a product of photo sharing's increasing popularity:

> As we amass an incredible amount of photos, it becomes increasingly difficult to manage our collections. Imagine if descriptive metadata about each photo could be appended to the image on the fly—information about who is in each photo, what they're doing, and their environment could become incredibly useful in being able to search, filter, and cross-reference our photo collections. Of course, we don't yet have the technology that makes this a practical proposition, but the Descriptive Camera explores these possibilities.

Much to the dismay, I'm sure, of the techies reading this, there's no magic ingredient that allows the camera to convert images into text on its own. Richardson utilized [Amazon's Mechanical Turk](https://www.mturk.com/mturk/welcome) project, a place where people can request fairly simple Human Intelligence Tasks (aka HITs) that others can complete for a small compensation. Each time Richards's camera takes a photo it creates an HIT for someone to complete. Once the HIT is completed, the camera prints out the description.

Richards reports that by setting the reward of each HIT at $1.25, he usually gets results back within 3-6 minutes. The site has its own approval and reputation system, which deters users from providing poor results. Some examples from the camera are below:

    	-----------------------------------
    	| |                             | |
    	| |                             | |
    	| |   This is a faded picture   | |
    	| |      of a dilapidated       | |
    	| |  building. It seems to be   | |
    	| | run down and in the need of | |
    	| |           repirs.           | |
    	| |                             | |
    	| |                             | |
    	| ------------------------------- |
    	|                                 |
    	|                                 |
    	-----------------------------------

    	-----------------------------------
    	| |                             | |
    	| |                             | |
    	| |    Looks like a cupboard    | |
    	| |    which is ugly and old    | |
    	| |  having name plates on it   | |
    	| |      with a study lamp      | |
    	| |       attached to it.       | |
    	| |                             | |
    	| |                             | |
    	| ------------------------------- |
    	|                                 |
    	|                                 |
    	-----------------------------------

    	-----------------------------------
    	| |  Corner of a wood floored   | |
    	| |   room with a tool chest,   | |
    	| |  bike, stack of books, box  | |
    	| |  leaning against the wall,  | |
    	| |   an open door with a bag   | |
    	| |  hanging off the doorknob,  | |
    	| |     and a pair of closed    | |
    	| |  double doors with cables   | |
    	| |   hanging on the handles.   | |
    	| ------------------------------- |
    	|                                 |
    	|                                 |
    	-----------------------------------

Obviously the idea is very primitive at this point and, frankly, has yet to be very practical. However, the concept addresses the possibility of allowing photos, and perhaps even video, to be indexed and searchable, which is something that provides serious value both personally and professionally.

[Check out Richards's website](http://mattrichardson.com/Descriptive-Camera/) for more information, photos, and press reaction about his Descriptive Camera project.
