Verat [![Gem Version](https://badge.fury.io/rb/verat.svg)](http://badge.fury.io/rb/verat) [![Dependency Status](https://gemnasium.com/adrrian17/verat.svg)](https://gemnasium.com/adrrian17/verat)
=====

Verat is a gitflow CLI manager. It is inspired in Vincent Driessen's [branching model](http://nvie.com/posts/a-successful-git-branching-model/) and his plugin [gitflow](https://github.com/nvie/gitflow)

##Installation
```
$ gem install verat
```

##Usage
###Features:

To start a new feature run this command, *FEATURE* will be the name of your new feature.
```
verat feature start FEATURE
```

Once you finished the feature run this command. It will checkout to your develop branch and merge the feature branch into develop.
```
verat feature finish FEATURE
```

###Hotfixes:
To start a new hotfix run this command, *HOTFIX* will be the name of your new feature.
```
verat feature start HOTFIX
```

Once you finished the hotfix run this command. It will checkout to master branch, merge the hotfix branch and then checkout to the develop branch and merge the hotfix branch.
```
verat feature finish HOTFIX
```

###Releases:
To start a new release run this command, *RELEASE* will be the version of the release.
```
verat release start RELEASE
```

Once you finished the release run this command. It will checkout to master branch, merge the release branch and then checkout to the develop branch and merge the release branch. Optionally you can pass the ```-t``` or ```--tag``` to create a tag with the name of the branch
```
verat release finish RELEASE
```
