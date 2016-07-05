syrinx.com
==========

> __DO NOT TOUCH MASTER BRANCH!!!__

> __ALL__ feature branches should be branched off of develop.

> Once completed __ALL__ feature branches should have a pull request for merge into develop branch.

> As of this moment(2016.06.21) ensure that __ALL__ pull requests are approved and merged by [jarrodtaylor](https://github.com/jarrodtaylor) prior to deploys.

> If you are uncertain how the deploy process works __DO NOT ATTEMPT A DEPLOY__.

Deploy to Development Server
----------------------------

If you haven't added the dev server repo yet (requires the Heroku toolbelt and maybe some permissions):
```bash
git remote add heroku https://git.heroku.com/quiet-atoll-36270.git
```

Then deploy the `develop` branch:
```bash
git push heroku develop:master
```

And preview at: https://quiet-atoll-36270.herokuapp.com

Deploy to Production Server
---------------------------

This will deploy to Github Pages at http://www.syrinx.com. Only deploy live code when it's ready to public consumption.

> This assumes your git origin is the Github repo (https://github.com/Syrinx/Syrinx.github.io.git).

```bash
gulp deploy
```
