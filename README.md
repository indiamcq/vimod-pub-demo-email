# Vimod-Pub Demo Email

Demo of Vimod-Pub making an emailable HTML

## Installation 

1. Download and install Node JavaScript, Windows Installer (.msi) 32 or 64 bit to suit your computer, from [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
2. Goto or create a folder where you want to install your script. (Not in **Program Files** as you need Admin approval for that area). Suggestion C:\node.
3. Open a command prompt.
4. In the command prompt type `npm install indiamcq\vimod-pub-demo-email`

The basic instalation is done

## Accessing the basic installation

5. When all done, type in `cd node_modules\Vimod-Pub-Demo-Email`
6. Then type in `pub`  then press \[enter\]

You can now create the email by following the menu steps

## Recommended Optional Changes

After before doing the two steps above, you may want to do the following.

* In Windows Explorer move the **Vimod-Pub-Demo-Email** folder to another place. It has been installed as a **node_module** but it is not really a **node_module**. So it does not need to stay in any particular location except out of Admin protected folders.
* Create a shorcut to pub.cmd in the **Vimod-Pub-Demo-Email** folder and put it in a place where you can find it.
* Now run the pub.cmd file via the created shortcut.

## Creating your own email (Short Version)

In the  **Vimod-Pub-Demo-Email\data\DemoEmail\2015-09** folder open the following files in your favourite text editor (PSPad for me) or Notepad:

* content.txt
* banner-subhead.txt
* calendar.txt
* link.txt

 Replace the demo email content with your content. Replace the banner.png with your PNG file of the same name.
 
 Run pub.cmd and create your HTML tailord to sending as an email.
 
 ## Creating your own email (Long Version)
 
 Read [DemoEmail-long-version.html](DemoEmail-long-version.html)