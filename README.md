## straw-viewer

A lightweight application (fork of [youtube-viewer](https://github.com/trizen/youtube-viewer)) for searching and playing videos from YouTube, using the [API](https://github.com/iv-org/invidious/wiki/API) of [invidio.us](https://invidio.us/).

### straw-viewer

* command-line interface to YouTube.

![straw-viewer](https://user-images.githubusercontent.com/614513/97738550-6d0faf00-1ad6-11eb-84ec-d37f28073d9d.png)

### gtk-straw-viewer

* GTK+ interface to YouTube.

![gtk-straw-viewer](https://user-images.githubusercontent.com/614513/84770876-11d69780-afe1-11ea-96f7-5d426dc865e5.png)


### STATUS

The project is in its early stages of development and some features are not implemented yet.


### AVAILABILITY

* Arch Linux (AUR): https://aur.archlinux.org/packages/straw-viewer-git/

* openSUSE: https://build.opensuse.org/package/show/home:Aptrug/straw-viewer

* Slackware: https://slackbuilds.org/repository/14.2/multimedia/straw-viewer/


### TRY

For trying the latest commit of `straw-viewer`, without installing it, execute the following commands:

```console
    cd /tmp
    wget https://github.com/trizen/straw-viewer/archive/master.zip -O straw-viewer-master.zip
    unzip -n straw-viewer-master.zip
    cd straw-viewer-master/bin
    perl -pi -ne 's{DEVEL = 0}{DEVEL = 1}' {gtk-,}straw-viewer
    ./straw-viewer
```

### INSTALLATION

To install `straw-viewer`, run:

```console
    perl Build.PL
    sudo ./Build installdeps
    sudo ./Build install
```

To install `gtk-straw-viewer` along with `straw-viewer`, run:

```console
    perl Build.PL --gtk
    sudo ./Build installdeps
    sudo ./Build install
```

### DEPENDENCIES

#### For straw-viewer:

* [libwww-perl](https://metacpan.org/release/libwww-perl)
* [LWP::Protocol::https](https://metacpan.org/release/LWP-Protocol-https)
* [Data::Dump](https://metacpan.org/release/Data-Dump)
* [JSON](https://metacpan.org/release/JSON)

#### For gtk-straw-viewer:

* [Gtk3](https://metacpan.org/release/Gtk3)
* [File::ShareDir](https://metacpan.org/release/File-ShareDir)
* \+ the dependencies required by straw-viewer.

#### Build dependencies:

* [Module::Build](https://metacpan.org/pod/Module::Build)

#### Optional dependencies:

* Local cache support: [LWP::UserAgent::Cached](https://metacpan.org/release/LWP-UserAgent-Cached)
* Better STDIN support (+ history): [Term::ReadLine::Gnu](https://metacpan.org/release/Term-ReadLine-Gnu)
* Faster JSON deserialization: [JSON::XS](https://metacpan.org/release/JSON-XS)
* Fixed-width formatting (--fixed-width, -W): [Unicode::LineBreak](https://metacpan.org/release/Unicode-LineBreak) or [Text::CharWidth](https://metacpan.org/release/Text-CharWidth)


### PACKAGING

To package this application, run the following commands:

```console
    perl Build.PL --destdir "/my/package/path" --installdirs vendor [--gtk]
    ./Build test
    ./Build install --install_path script=/usr/bin
```

### INVIDIOUS INSTANCES

Sometimes, the default instance, [invidious.snopyta.org](https://invidious.snopyta.org/), may fail to work properly. When this happens, we can change the API host to some other instance of invidious, such as [invidious.tube](https://invidious.tube/):

```console
    straw-viewer --api=invidious.tube
```

To make the change permanent, set in the configuration file:

```perl
    api_host => "invidious.tube",
```

Alternatively, the following will automatically pick a random invidious instance everytime the program is started:

```perl
    api_host => "auto",
```

The available instances are listed at: https://instances.invidio.us/

### PIPE-VIEWER

[pipe-viewer](https://github.com/trizen/pipe-viewer) is an experimental fork of `straw-viewer` with the goal of parsing the YouTube website directly, and thus it may be a faster and more reliable alternative.


### SUPPORT AND DOCUMENTATION

After installing, you can find documentation with the following commands:

    man straw-viewer
    perldoc WWW::StrawViewer

### LICENSE AND COPYRIGHT

Copyright (C) 2012-2020 Trizen

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
