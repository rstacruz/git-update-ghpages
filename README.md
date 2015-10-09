# git-update-ghpages

Uploads a directory to gh-pages. Perfect for use with Travis-CI deployments.

```
git-update-ghpages rstacruz/myproject _docs
```

```
==> cd /var/folders/7d/tmp.9dgEYWLD
==> git init
Initialized empty repository in /var/folders/7d/tmp.9dgEYWLD

==> git checkout -b gh-pages
Switch to a new branch 'gh-pages'

==> Copying contents from _docs
x index.html
x license.html
x contributing.html

==> git commit -m Update
[gh-pages 06829a94] Update
  16 files changed, 16085 insertions(+)

==> git push https://github.com/rstacruz/myproject.git gh-pages
==> rm -rf /var/folders/7d/tmp.9dgEYWLD
==> Done.
```

[![Status](https://travis-ci.org/user/repo.svg?branch=master)](https://travis-ci.org/user/repo "See test builds")

## Automated Travis deployment

You can use Travis to automatically deploy your static website to GitHub pages.

#### Adding your token

Make sure Travis is already enabled on your repository. Generate a [GitHub token](https://github.com/settings/tokens/new) and add it to your repo.

```sh
# gem install travis
travis encrypt GITHUB_TOKEN=... --add
```

#### Configuring builds

Add this to your `.travis.yml` manifest. This will make a build happen after your test, then a deployment right after that. In this example, we're deploying `_docs` to `user/repo`.

```yaml
# .travis.yml
env:
  global:
    - GIT_NAME: Travis CI
    - GIT_EMAIL: nobody@nobody.org
    - GITHUB_REPO: rstacruz/myproject
    - GIT_SOURCE: docs
    - secure: ... # added by 'travis encrypt'

script:
- npm test     # ...or whatever your test command is
- make build   # ...or whatever your build command is
- if [[ "$TRAVIS_BRANCH" == "master" ]]; then npm install git-update-ghpages && ./node_modules/.bin/git-update-ghpages -e; fi
```

#### For Node.js projects

If your project is a Node.js project, you can simplify this by adding `git-update-ghpages` to your *devDependencies*.

```sh
npm install --save-dev --save-exact git-update-ghpages
```

```yaml
# .travis.yml
- if [[ "$TRAVIS_BRANCH" == "master" ]]; then ./node_modules/.bin/git-update-ghpages -e; fi
```
