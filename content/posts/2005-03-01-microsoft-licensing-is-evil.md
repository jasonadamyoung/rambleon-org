---
title: Microsoft Licensing is Evil
author: jay
type: post
date: 2005-03-01T02:50:31+00:00
url: /2005/03/01/microsoft-licensing-is-evil/
categories:
  - Uncategorized
tags:
  - sysadmin

---
I hate Microsoft.

No, correct that, I hate Microsoft licensing. Which might as well be Microsoft. Because as much as the blogging side of Microsoft is trying, Microsoft licensing clearly has no interest in promoting innovation.

We have an ongoing project where we are building a web-based scheduler to provide reservation-based access to our existing Solaris and Linux labs, and Linux/Windows XP on blade “PC’s”. This project was [brainstormed about][1] just over two years ago, and has merged with our peers in NC State [High Performance Computing][2] to become our [Virtual Computing Lab][3] project.

Like a lab, where we multiplex 7000 graduate and undergraduate students through 1200+ central and departmental labs in the College of Engineering alone — we are doing something similar with remotely-accessible (via RDP or SSH-tunneled X Windows) computers (blades or standard workstations) — setting up a number of these to handle reservation-based dedicated single-user use (or colloquially “a virtual butt-in-the-seat”).

We have licensed the XP os for each blade we have (covered under existing agreements for licensing operating systems for our labs).

Well, it appears that sometime during 2004, Microsoft implemented the Remote Desktop License — a separate license covering access to XP Pro and XP Pro Blade Edition.

While trying to find information about the licensing restrictions for Microsoft XP Professional — if you go to [Microsoft’s Product Licensing Page for Windows XP Professional][4]

(**WHICH BY THE WAY IS ONLY USEABLE IN [EXPLETIVE EDITED] MICROSOFT INTERNET EXPLORER FOR WINDOWS**)

You’ll find the following (I managed to get the direct links by printing the page, and getting the link out of the footer of the printed page — oh yeah, by the way, while connected via RDP to an XP box from a Macintosh which is really ironic — but likely legal for my own scenario):

[Definitions and General Use Rights and Restrictions (applicable to all products)][5]

[General Use Rights and Restrictions for Microsoft Systems][6]

[Rights and restrictions for Microsoft® Windows XP Professional][7]

The overall “Product Use Rights” for all Microsoft Software Packages is [on this page][8] as a [PDF file][9]

Specifically — the paragraph in the [Rights and restrictions for Microsoft® Windows XP Professional][7] document:

> “1. Remote Desktop/Remote Assistance/NetMeeting. The Software contains Remote Desktop, Remote Assistance, and NetMeeting technologies that enable the Software or applications installed on the Workstation Computer (sometimes referred to as a host device) to be accessed remotely from other Devices. You may use the Softwares Remote Desktop feature (or other software which provides similar functionality for a similar purpose) to access a Workstation Computer Session from any Device provided you acquire a separate Software license for that Device. As an exception to this rule, the person who is the single primary user of the Workstation Computer may access a Workstation Computer Session from any Device without acquiring an additional Software license for that Device. When you are using Remote Assistance or NetMeeting (or other software which provides similar functionality for a similar purpose) you may share a Session with other users without acquiring additional licenses for the Software. For Microsoft and non-Microsoft applications, you should consult the license agreement accompanying the applicable product or contact the applicable licensor to determine whether use of the product with Remote Desktop, Remote Assistance, or NetMeeting is permitted without an additional license.”

By the way, this is not in the [Windows XP Professional EULA][10]:

>   1. DESCRIPTION OF OTHER RIGHTS AND LIMITATIONS.: NetMeeting/Remote Assistance/Remote Desktop Features. The Product contains NetMeeting, Remote Assistance, and Remote Desktop technologies that enable the Product or other applications installed on the Workstation Computer to be used remotely between two or more computers, even if the Product or application is installed on only one Workstation Computer. You may use NetMeeting, Remote Assistance, and Remote Desktop with all Microsoft products; provided however, use of these technologies with certain Microsoft products may require an additional license. For Microsoft and non-Microsoft products, you should consult the license agreement accompanying the applicable product or contact the applicable licensor to determine whether use of NetMeeting, Remote Assistance, or Remote Desktop is permitted without an additional license.

According to the [NC State Microsoft Select Agreement][11] [Price List][12], the so-called “Remote Desktop License” is $62.30 academic.

I almost understand the licensing for corporations — a corporation has 1000 people previously running Windows XP, and now said corporation is sending those 1000 people to 100 blades.

But University Labs have **always** been this way.

I hope we do everything we can do to get rid of every last Microsoft product we use. I have lost 10 years of my life today trying to figure out their [expletive deleted] license nonsense.

What a shame too. dot-NET, tablet PC’s and their bloggers are cool.

 [1]: //people.engr.ncsu.edu/jayoung/site/pages/vbits"
 [2]: //hpc.ncsu.edu"
 [3]: //vcl.ncsu.edu"
 [4]: //www.microsoftvolumelicensing.com/userights/ProductPage.aspx?pid=91"
 [5]: //www.microsoftvolumelicensing.com/userights/GeneralUseRights.aspx"
 [6]: //www.microsoftvolumelicensing.com/userights/productCategory_2.aspx"
 [7]: //www.microsoftvolumelicensing.com/userights/ProductSpecificExceptions.aspx?pid=91"
 [8]: //www.microsoft.com/licensing/resources/downloads/default.mspx"
 [9]: //download.microsoft.com/download/a/5/f/a5fc3270-2fe6-4536-b228-6b333ab8569d/PURJan2005.pdf"
 [10]: //www.microsoft.com/windowsxp/pro/eula.mspx"
 [11]: //www.ncsu.edu/it/essentials/software_ncstate/microsoft/academic_select.html"
 [12]: //www.shi.com/attachments/enterprise11046/nceducurrentpricelist.xls"