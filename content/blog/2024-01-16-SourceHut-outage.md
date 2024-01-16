---
title: Information regarding the SourceHut outage
author: Drew DeVault
date: 2024-01-16
---

SourceHut is currently experiencing an extended outage due to a distributed
denial-of-service (DDoS) attack. We have been hard at work restoring service to
our users, and expect the remaining services to come online this week. Thank you
for your patience and words of support, we appreciate it very much.

Once we have finished handling the majority of the work associated with the
outage mitigations, we will be publishing a full post-mortem. For up-to-date
information regarding the status of the outage and work associated with it,
please consult [status.sr.ht](https://status.sr.ht).

The billing system has been disabled for the duration of the outage: you will
not be charged until we have fully restored service. Once restored, we will
credit paid users with service for the duration of the outage.

The current service status is as follows:

<table>
  <thead>
    <tr>
      <th>Service</th>
      <th style="min-width: 300px">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>sr.ht (project hub)</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>meta.sr.ht</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>git.sr.ht</td>
      <td><span class="text-success">Full service</span><sup>1</sup></td>
    </tr>
    <tr>
      <td>hg.sr.ht</td>
      <td><span class="text-success">Full service</span><sup>1</sup></td>
    </tr>
    <tr>
      <td>lists.sr.ht</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>todo.sr.ht</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>man.sr.ht</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>paste.sr.ht</td>
      <td class="text-success">Full service</td>
    </tr>
    <tr>
      <td>builds.sr.ht</td>
      <td><span class="text-success">Full service</span></td>
    </tr>
    <tr>
      <td>chat.sr.ht</td>
      <td class="text-danger">Out of service</td>
    </tr>
    <tr>
      <td>pages.sr.ht</td>
      <td><span class="text-warning">Degraded service</span><sup>2</sup></td>
    </tr>
  </tbody>
</table>

<sup>1</sup> We have restored git and hg from backups which were several hours
old at the time the outage began, and manually imported changes which took place
between the time of the last backup and the start of the outage.

If your repository is still out-of-date, please take the following steps:

1. If you have access to the up-to-date repository locally, please `git push` or
   `hg push` your changes to bring the online version up-to-date.
2. If you do not have access to your repository locally, please
   [contact support](mailto:~sircmpwn/sr.ht-support@lists.sr.ht) for assistance.

<sup>2</sup> pages.sr.ht is online for full service, with the following
caveats:

1. Publish operations are working with degraded performance
2. Manual intervention is required for users using custom domains with apex
   records (e.g. example.org rather than subdomain.example.org)

For users with apex records, please update your apex record as follows:

    @   IN  A   141.95.4.185

This IP address is available on a temporary basis. Make sure your email address
on file is up-to-date; we will email you if and when it changes to notify you
of the steps required to update your website.
