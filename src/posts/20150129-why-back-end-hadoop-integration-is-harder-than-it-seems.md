---
title: Why Back-End Hadoop Integration is Hard
description: When integrating Hadoop into an enterprise's infrastructure, it's preferable to partner up with consultants that stay with you every step of the way.
archive_title: Why back-end Hadoop integration is harder than it seems
---

# Why Back-End Hadoop Integration is Harder Than it Seems

Explaining Hadoop to someone with only a basic understanding of data architecture technology can be tough. Even most database administrators who are familiar with the open source solution would be hard-pressed to explain how to appropriately integrate Hadoop into an organization's back-end infrastructure and make it compatible with front-end applications.

**Clarifications  **  
It's as easy to misunderstand Hadoop's "out-of-the-box" configuration as it is to mistake Linux for a free-to-use, ready-for-deployment open source desktop operating system. For example, by itself, Linux is kernel, meaning it allocates a PC's resources to other programs running on that machine, but it doesn't actually function as what programmers understand to be a complete OS. People need a Linux _distribution_ to bring structure to the machines they use everyday (Ubuntu is arguably the most popular Linux distro).

_"_What resources does Hadoop demand of developers in charge of making it enterprise-ready?"__

Although not an OS, the functionality and workflow associated with Hadoop is similar to that of the Linux kernel in that companies such as Cloudera and Hortonworks develop and release "enterprise-ready" distributions of the big data architecture. All too often, we've come across enterprise leaders who view Hadoop as a ready-to-use database capable of storing, transporting and analyzing unstructured, semi-structured and structured data, but this isn't necessarily the case.

This conclusion brings up a number of questions: How do Hortonworks and Cloudera configure Hadoop to make it compatible with existing corporate systems? What resources does the technology demand of developers in charge of making it enterprise-ready?

**It's not necessarily complete **  
Open Source Insider's Adrian Bridgwater attended the 2013 Red Hat Summit in Boston, where the event keynote speaker asked how many of the open source developer attendees "[had witnessed full-scale Hadoop big data implementations](http://www.computerweekly.com/blogs/open-source-insider/2013/10/is-hadoop-hard.html) in their business." The answer? Bridgwater guessed 10 percent of those members raised their hands. He acknowledged an explanation of Hadoop by MetaMarkets CEO Mike Driscoll, who puts the solution into perspective:

"Hadoop is a foundational technology, but it is not a database, it is not an analytics environment, and it is not a visualization tool. By itself, it is not a solution for helping businesses make better decisions," said Driscoll. as quoted by Bridgwater.

Yet Hadoop is often mistaken for a database, a visualization program or an analytics environment. What about tools such as Ranger, HIVE, PIG and MapReduce? Remember that these are add-ons (some libraries, others applications) to what was once a bare-bones library. In other words, Hadoop has the capability of performing all of these functions, but it doesn't come with them without further development.

![Hadoop can provide the foundations of a big data architecture. ](http://pictures.brafton.com/x_0_0_0_14094738_800.jpg)Hadoop can provide the foundations of a big data architecture.

According to a white paper written by Indus and Axiomine, [developing an enterprise-ready distribution](http://www.induscorp.com/sites/indus/files/uploads/adoptinghadoopintheenterprise.pdf) of Hadoop obligates you to keep security, IT infrastructure development, traditional architecture compatibility and staff instruction in mind.

**Security **  
From a data protection standpoint, the Hadoop Distributed File System can be a bit tricky. Once an authorized user is given complete visibility over all the data within the HDFS​, he or she can view every data set within the system. So, how easy is it for a cybercriminal to masquerade as a legitimate administrator? Cloudera noted that integrating the Kerberos protocol into Hadoop [will establish user authentication](http://blog.cloudera.com/blog/2012/03/authorization-and-authentication-in-hadoop/) processes that are otherwise absent from Hadoop. 

_"Libraries such as HIVE, PIG and RHIPE have made Hadoop more compatible."_

Kerebos operates under an authentication model that uses "tickets" to verify the identities of not only servers, but users requesting access to those machines. Kerebos' principles can be applied at a more granular level, specifically to tables, columns and even data cells. Truth be told, more can be said about Hadoop security - a topic that will be discussed in later articles.

**Co-existing with other libraries **  
When it was first released, Hadoop was a Java-only framework, making it incredibly difficult for developers to integrate it into systems consisting of SQL databases, C language-based applications and other technologies. Now, libraries such as HIVE, PIG and RHIPE have made Hadoop more compatible with existing assets.

For instance, PIG accommodates programmers well-acquainted with SQL and procedural data processing pipeline languages such as SAS and R. In addition, Hadoop Streaming makes MapReduce compatible with Unix Scripts, Python, SAS and R - all of which are non-Java based programs, according to the Indus and Axiomine white paper. In conclusion, Hadoop is more flexible than it was during its inception.

_"It's preferable to partner up with a team of consultants."_

**From the developer's point of view **  
When integrating Hadoop into your enterprise's infrastructure, it's preferable to partner up with a team of consultants that will stay with you every step of the way. Hadoop developers aren't just programmers, they possess in-depth knowledge of system administration and algorithm construction. Although Hadoop's API compatibility has made customization and integration easier, working with authorities on the technology will help you navigate any roadblocks you may encounter.
