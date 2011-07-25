## Installation

Copy the `git-update-ghpages` file to somewhere in your path.

## Usage

    git update-ghpages username/repository [options]

## Options

    -p, --prefix      The prefix
    -i, --input       Input (defaults to current directory)
    -b, --branch      The branch to deploy to (defaults to gh-pages)

## Examples

Update the repo 'coffee' of github user 'james' with the files from the
current directory. The files will be in http://james.github.com/coffee.
  
    $ git update-ghpages james/coffee

Same as above, but take the files from 'doc/'.

    $ git update-ghpages james/coffee -i doc

Same as the first, but the files will instead be in
http://james.github.com/coffee/manual.

    $ git update-ghpages james/coffee -p manual

Update the http://james.github.com itself. GitHub says the branch for
these should be `master` instead of `gh-pages`.

    $ git update-ghpages james/james.github.com -b master
