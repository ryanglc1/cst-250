# Using Mercurial #

Since there has been some confusion as to how to use Mercurial, it occurred to me that we might all benefit from a little community-edited wiki page on it.

The Internet has many good resources for version control, so poking around online is always a good idea when you're having trouble. However, laziness can be a virtue, so here are three very good tutorial pages (actually all sub-pages of the same tutorial) that can be used as a first resort when you might be having trouble:

  * [Interacting with the repo](http://hginit.com/02.html)
  * [Fixing your mistakes](http://hginit.com/03.html)
  * [Getting other people's changes](http://hginit.com/04.html)

Even that can be a bit tedious, though, so here are the basic steps for making changes:

  1. Pull changes from the repo (`hg pull`)
  1. Make your local changes
  1. If you've created new files, add them (`hg add`)
  1. Commit your changes (`hg commit -u "your username" -m "your message"`)
  1. Push your changes to the repo (`hg push`) Never **EVER** force!
    * ote that you need a password. This password can be found at [Google Code Password](https://code.google.com/hosting/settings)

Sometimes you want to delete a file that you have created, so here are the steps for that:
  1. Delete a file from your workspace, and mark for removal from the repo (`hg remove`)
  1. Commit your changes (`hg commit -u "your username" -m "your message"`)
  1. Push changes (`hg push`)

You also may want to unmark a file for addition
  * To unmark a file for addition
    * (`hg forget <file name>`)
  * To see which files are marked for addition/deletion, use (`hg status`)

We also had issues in the lab regarding merge - there were multiple branches that existed, and we had to select a branch to merge with. You can merge branches using the following:

  1. (`hg heads`) - get a list of all branches that exist
  1. (`hg merge <head code>`) - select a branch to merge with. The head code can either be the tag name of the changeset number of the branch, which are both listed by using (`hg heads`)
  1. Now you have merged with a branch, and going through commit and push will push the updated branch


I'll also be bothering our instructor about making a forum in the class discussion board for questions. I'm no expert in version control, but I bet we can all figure things out if we put our heads together.

If you have anything to add to this page, please do. Wikis exist to be edited!