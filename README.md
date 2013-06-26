# psymine

Psymine is an API interface to Redmine. This gem requires no dependencies in
order to work with Redmine.

* [Homepage](https://rubygems.org/gems/psymine)
* [Documentation](http://rubydoc.info/gems/psymine/frames)
* [Email](mailto:lethaljellybean at gmail.com)

### Disclaimer

I'm still working on this. Check back later or send me a message if you have
questions.

## Description

I initially wanted a lightweight library that I could use in order to combine
another project of mine (called wlog). I need and want something that I can
log my work on local tasks, and then push them to redmine (kind of like 
distributed version control). 

If you can find a use for this with your project as well, then ... EXCELLENT.

## Features

A very simple way of querying your redmine stuff programmatically for any given
reason.

## Examples

    require 'psymine'

## Requirements

* Ruby 2.0 (probably works with earlier versions too, give me a shout 
confirming if so).

* Redmine version is greater or equal to 1.1.0 (We use authentication by
passing the API key through an HTTP header) (Also make sure that you enable
your REST services on the Redmine administration panel. You can read more about
this [here](http://www.redmine.org/projects/redmine/wiki/Rest_api#Authentication).)

## Install

    $ gem install psymine

## Bugs / Complaints / Questions

If there is anything ever that arises, you can just open an issue on the github
tracker of this project.

Also, I'm supporting the core features of the API for redmine. I have finite
time on my hands, so if there's something missing, it should be relatively 
easy to implement.

## Copyright

Copyright (c) 2013 psyomn, GPL v3.0

See {file:LICENSE.txt} for details.
