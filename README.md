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

## Automated Travis deployment

You can use Travis to automatically deploy your static website to GitHub pages.

### Adding your token

Make sure Travis is already enabled on your repository. Generate a [GitHub token](https://github.com/settings/tokens/new) and add it to your repo.

```sh
# gem install travis
travis encrypt GITHUB_TOKEN=... --add
```

### Configuring builds

Add this to your `.travis.yml` manifest. This will make a build happen after your test, then a deployment right after that. In this example, we're deploying `_docs` to `user/repo`.

```yaml
script:
- npm test     # ...or whatever your test command is
- make build   # ...or whatever your build command is
- npm install rstacruz/git-update-ghpages
- ./node_modules/.bin/git-update-ghpages --author="Travis CI <nobody@nobody.org>" user/repo _docs
```
