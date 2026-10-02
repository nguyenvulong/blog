---
title: AWS walkthrough
description: Quick notes on getting started with AWS, plus a warning about hidden SageMaker Studio notebook charges.
date: 2020-06-23T10:44:08+00:00
url: /aws-walkthrough/
categories:
  - Uncategorized
tags:
  - aws
  - tutorial
  - walkthrough

---
> **Update (2026):** These notes are from 2020. AWS console layouts, free-tier terms and SageMaker Studio (since reworked) have changed, so check the current AWS documentation and pricing pages.

Projects galore. You need to log in to the [AWS management console](https://console.aws.amazon.com/) to try them out.

![AWS console project list](/wp-content/uploads/2020/06/image-1024x844.png)

Tons of hands-on tutorials can be found [here](https://aws.amazon.com/getting-started/hands-on/).

A free instance (with an attached IP address) can be created easily using [Lightsail](https://aws.amazon.com/lightsail/).

![Creating a Lightsail instance](/wp-content/uploads/2020/06/image-1.png)

![Lightsail instance details](/wp-content/uploads/2020/06/image-2.png)

## A warning about charges

A bit of confusion can cost you money. You are charged for the notebook instance **inside** Amazon SageMaker Studio, but the "Notebook instances" tab won't show any running notebook. Make sure to delete the app and user inside Amazon SageMaker Studio to avoid unexpected charges from a notebook instance still running there. In the two photos above, a notebook instance charge occurred, yet no notebook instance is visible in the second photo.
