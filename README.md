# git-update-ghpages

Uploads a directory to gh-pages. Perfect for use with Travis-CI deployments.

```
$ git-update-ghpages rstacruz/myproject _docs

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
==> Done.
```
