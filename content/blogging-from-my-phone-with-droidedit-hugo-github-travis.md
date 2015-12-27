+++
Description = "A cool Android text editor plus some back-end tooling makes for a very useful blogging platform."
date = "2015-12-27T16:38:29Z"
title = "Blogging from my phone with DroidEdit, Hugo, GitHub Pages and Travis"

+++

I switched this blog to the superb Go-based tool [Hugo](https://gohugo.io/overview/usage/) earlier in the year. Its staggering speed compared to HarpJS and Hexo plus a single executable you can drop in anywhere, make it a no-brainer for static blogs.

I continued to host for free on [GitHub Pages](https://pages.github.com/) which means I never ever ever have to worry about WordPress security exploits or badly written plugins again. However using GH Pages means you are quite limited in how things work.

For several months I used Hugo in the recommended way of having [one Git repo](https://github.com/conoro/hugo.conoroneill.net) for the blog's "source files" and then the original [conoro.github.io repo](https://github.com/conoro/conoro.github.io) as a Git sub-module for the deployed HTML. I've never heard a good word said about Git sub-modules and now I understand why. Nasty awkward things that mess everything up if you blink wrong. But it worked ok-ish until I decided to try [Travis CI](https://travis-ci.org).

Travis is a continuous integration tool that can watch for changes in your GitHub repos and then run "jobs" on them. It's mainly used for building software but there is no reason you can't use it for building a blog. So the initial idea was that I would git add/commit a new blog post in my source repo and then Travis would run Hugo on it and commit the generated HTML to the blog, thereby publishing it.

The real intent was so I could blog from devices that don't run Hugo like phones and tablets. Of course they'd somehow need to support a text editor and Git but not Hugo itself.

For Android I quickly found the superb [DroidEdit](https://play.google.com/store/apps/details?id=com.aor.droidedit.pro&hl=en) which has Git support built-in. It was dead easy to use it to generate a new post and add that to my repo. So I would have almost WordPress-level of easiness in blogging on the fly. Its only real drawback is the lack of Markdown syntax highlighting.

![DroidEdit](https://s3-eu-west-1.amazonaws.com/conoroneill.net/wp-content/uploads/2015/12/droidedit.png)

Except then I tried to get it working with Travis. Several weekends of effort trying to wrangle the Git sub-module setup into submission ended in total frustration. Finally today I said "sod sub-modules" and went old-school "copy the files from one repo to the other and commit them there". And ye know what? [It worked](https://travis-ci.org/conoro/hugo.conoroneill.net)!

There's a few bits in there to do with using https:// instead of git://. But the critical one-off steps on your PC are:

1. get a [Github token](https://github.com/settings/applications) for Travis
2. Then [install Travis locally](https://docs.travis-ci.com/user/encryption-keys/)
3. and encrypt your token via:
```bash
travis encrypt GH_TOKEN=<secret token here>  
```
4. Finally add that output to the "secure" string in .travis.yml.


So here you go with the files you need to do the same:

.travis.yml
```yaml
language: go
go:
  - 1.5.1
sudo: required
env:
  global:
  - USER: Conor O'Neill
  - EMAIL: cwjoneill@gmail.com
  - GH_REF: github.com/conoro/conoro.github.io.git
  - REPO: conoro.github.io
  - GH_REPO: github.com/conoro/${REPO}.git
  - secure: "hHQScM7MWsK/74fvtoBn7lKuTKx1XlU08Ee4UD6ce0wfKNdE/W8z2dn8qzEsSw3YaoU6AULQgXthX+LVAXVZr1wIC6H9Kvjilaj+9ffRXFKrUv79q8s4EiOKqIvYGla5XlhIzP1Qu1qyLCA4dzgaQF6Cn2jB9AkkObnd8YArf3aW3LUbAnRy0ySo0A/QRupN/ckb81LXYnfbzQZB9zniBIhvGPipR0KdQL7GePShPWDeXJPpblo5kEXiIvHo7b1XYx+xACmaQR9PdoDgoTCAFqz2tJzCU92PnbIGw4Jv/ZdnWmt8Z6/4dO73UhcE3PokPvmg7tdsHbFWxhEzg0NaC7cvYsH3xWy9uTipwYLRd3eGbBt+htCZOj+slNHzREkPJBtEBw+b4iLDAr0T5V0kyflgsGOcgSXPyLIKsI0rHFRVAsZxowowK1UjZ05tnSIlFcIK8DX9c0JoXpM2ktOUt8/2EPCbaoKv17HW4BVDb7vXR8VzBf5MY4qku9NrmmYTMJXrzcdQU8JrbASPlHyF79n5xiiyg74Vq2OYCgHPg1nzmSrC1YgQu0W5WXNjWo9jt8h9C3ztuNYvDJkKkXl7KZDTq/s2XEzpzuLIA4rdTX+7lUB93ggN2YFeh6LV+kq58L8BpMPyiT8kxZLMF0HFTzaRNNwymelkPsV/+QZydro="
git:
  submodules: false
# Use sed to replace the SSH URL with the public URL, then initialize submodules
before_install:
  - sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules
install:
  - sudo pip install Pygments
  - go get github.com/spf13/hugo
script: bash ./deploy.sh
```

deploy.sh
````bash
#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "cwjoneill@gmail.com"
git config --global user.name "Conor O'Neill"

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

git clone https://github.com/conoro/conoro.github.io.git
cp -R public/* ${REPO}
cd ${REPO}
git remote
git add -A :/
git commit -a -m "latest via travis"
git push "https://${GH_TOKEN}@${GH_REPO}" master > /dev/null 2>&1
````
