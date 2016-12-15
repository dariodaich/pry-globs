[![Gem Version](https://badge.fury.io/rb/pry-globs.svg)](https://badge.fury.io/rb/pry-globs)
[![Build Status](https://travis-ci.org/da1chy/pry-globs.svg?branch=master)](https://travis-ci.org/DarioDaic/pry-globs)
[![Test Coverage](https://codeclimate.com/github/DarioDaic/pry-globs/badges/coverage.svg)](https://codeclimate.com/github/DarioDaic/pry-globs/coverage)
[![Code Climate](https://codeclimate.com/github/DarioDaic/pry-globs/badges/gpa.svg)](https://codeclimate.com/github/da1chy/pry-globs)

# pry-globs

## What is it?

It is a Pry plugin that enables you to find out the meaning of preset global
variables within a Pry session.

## Why, o why?

Often enough I come across a global variable, or a rarely used constant,
that is unknown to me. If you ever encountered one you know that Ruby's
internal global variables are anything but friendly named.

So, instead of "googling" for them each time, I decided to place them all under
my fingertips. And what place better then a Pry session!? :sunglasses:

## Installation

As usual...
```
$ gem install pry-globs
```

## Usage

Each global variable has its _definition_ and _explanation_.

_Definition_ is mostly concise general description, while an _explanation_ is
usually has an accompanying code example.

In order to get a _definition_ or a constant, just pass its name to a **globs**
command:
```
>> globs $!
Definition:
The exception information message set by 'raise'.
```

If you want to get an _explanation_ as well as a _definition_, pass it an
**-e** option.
```
>> globs -e $!
Definition:
The exception information message set by 'raise'.

Explanation:
It contains the exception when it is raised but not yet handled.
In most cases it can be accessed within the 'rescue' clause.

Given the following code..
> begin
>   5 / 0
> rescue
>   p $! # => #<ZeroDivisionError: divided by 0>
> end

Or when raising exception manually..
> class MyError < StandardError
> end
>
> begin
>   raise MyError, "Raise it high."
> rescue MyError
>   p $!         # => #<MyError: Raise it high.>
>   p $!.message # => "Raise it high."
> end
```

## Caveats

Unfortunately, it is not possible to fetch data for _$'_ and _$"_
because of the _ArgumentError_ within Pry. Pry parses an opening quote
as an opening string quote. This can't be solved withing pry-globs,
rather Pry should be patched. I am of the opinion that the fix isn't
worth of someone's hour or two, or three...

## Contributing

As you can imagine, the hardest part was to fill the YAML file with all the data.
Mainly because it involved nontrivial research time. With that said, it is possible
that you will bump in to a mistake here and there. If you: find one, wish to expand on the
existing data, or add your own, feel free to do so. You will have my gratitude. :bow:

Although the application is a small one, test suite exists. In case you
add code and decide to open a PR, please add tests as well.

If you decide to only add documentation to YAML file you don't have to add any tests.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
