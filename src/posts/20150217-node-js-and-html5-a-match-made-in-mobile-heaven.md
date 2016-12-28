---
title: Node.js and HTML5&#58; A Match Made in Mobile Heaven?
description: HTML5 and Node.js makes for a heck of a combination for developers creating mobile apps with the likes of chat, data collection and payment apps.
archive_title: Node.js and HTML - A match made in mobile Heaven?
---

# Node.js and HTML5: A Match Made in Mobile Heaven?

If runtime environments and coding languages died and ascended to some strange mobile-based afterlife, Node.js and HTML5 would probably get hitched. 

While they may not be frolicking in the Elysian Fields or fighting giants alongside Odin in Valhalla, HTML5 and Node.js make for a heck of a combination for developers creating data-heavy mobile apps. We're talking about the likes of chat, data collection and payment apps. Let's find out why. 

_"Node.js enables applications, based on the information it receives, to proactively send services users."_

**Node.js: The reason you have push notifications **  
Tomislav Capan, a JavaScript developer and contributor to the blog of developer networking service Toptal, provided newbies with a comprehensive tutorial [of what Node.js is](http://www.toptal.com/nodejs/why-the-hell-would-i-use-node-js), and why it's so prevalent among Web and mobile applications. You know how the app for your favorite sports team sends you a notification every time they score a goal? Node.js is behind that. 

Before Node.js, the only way a client (in tech-speak, an end-user) could receive services from a Web server, enterprise solution or any other program was by sending a request. Node.js enables the application, based on the information it receives, to proactively send relevant services to the client. How? By allowing JavaScript to run on the client machine (i.e., where it aggregates data from). 

Keep in mind that the situation above is an example of _what you can do with_ Node.js. Those who are familiar with the platform know that the main functionality behind Node.js lies in how it handles data traffic. As opposed to creating a new thread every time a connection is established, Node.js operates on a single thread. From there, it uses non-block I/O calls, which enables it to support an incredible number of connections. 

**HTML5: Providing the flash to your apps **  
The National Hockey League iOS app allows users to watch video highlights of the previous nights' top plays. A developer could only make this happen by coding the application with HTML5. Building it in XHTML and making it compatible with a Flash plugin? Not possible. 

According to MakeUseOf contributor Joel Lee, the developers of HTML5 [constructed the language](http://www.makeuseof.com/tag/what-is-html5-and-how-does-it-change-the-way-i-browse-makeuseof-explains/) based on the following principles:

  * Web applications and other programs should not need plugins to run moving content
  * Scripting should be replaced with markup wherever feasible
  * Apps should be available across all devices and operate consistently across every one 
  * The development process is public, allowing interested parties to see how instances are being supported and sanctioned 

Basically, HTML5 is the standard language for modern websites, and is a viable option for mobile developers. Tech Cocktail's Alfred Beiley noted that HTML5 allows for multiple instances to occur at once while "keeping the center of attraction intact." For instance, although four moving advertisements may pop up on the tech publication you're reading, the main article won't become distorted or fail to load. 

![Node.js promises to offer leaner, faster data communication. ](http://pictures.brafton.com/x_0_0_0_14093604_800.jpg)Node.js promises to offer leaner, faster data communication.

**An example of HTML5 and Node.js's compatibility **  
In regard to what we've told you about Node.js and HTML5, it's easy to see how one can support the other. On the front end, HTML5 allows an app to run on a device without overwhelming resources. On the back end, Node.js enables the app to deliver content to hundreds of thousands of users accessing services simultaneously. 

Kiran Prasad, LinkedIn's mobile development head, told VentureBeat that HTML5 [was used to build its mobile Web](http://venturebeat.com/2011/08/16/linkedin-node/), iOS and Android deployments, allowing the firm to quickly release new features when they were warranted. The team in charge of the project emphasized the need for a lightweight app, prompting them to allow the app to store connections locally. This means even offline users can still access LinkedIn's services. 

_"How you plan to use Node.js and HTML5 depends on what kind of app you're trying to develop."_

The server side of LinkedIn's mobile software stack is entirely constructed with Node.js, however. This choice was based on Node.js's ability to communicate with different solutions, such as LinkedIn's platform API and database. Before using Node.js, the company was operating 15 servers, each with 15 virtual machines. After using Node.js, only four VMs per server were required, which cumulatively handled twice the amount of traffic managed by the previous setup. 

**Final considerations **  
As a data communication platform, Node.js does just fine. However, it doesn't necessarily scale up to par in regard to analytics. Why? Due to the fact that a single thread could theoretically sanction almost 1 million concurrent connections (assuming the server has 8GB of RAM available), the data stream would slow immensely if CPU-intense responsibilities were added to the functionality.

How you plan to use Node.js and HTML5 really depends on what kind of app you're trying to develop.
