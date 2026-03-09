---
layout: base.html
title: Team Analytics
description: Understand your team's performance with real-time analytics and velocity tracking in TaskFlow.
---

<section class="page-header" aria-labelledby="page-heading">

# Team Analytics

Data-driven insights to help your team work smarter, not harder.

</section>

<section class="feature-detail" aria-labelledby="overview-heading">

## Understand Your Team's Performance

TaskFlow Analytics transforms raw project data into actionable insights. Track velocity trends, identify workload imbalances, and make informed decisions about resource allocation -- all from a single dashboard.

### Key capabilities

- **Velocity tracking** -- Monitor tasks completed per week and spot trends
- **Workload distribution** -- Ensure no team member is overloaded or underutilized
- **Completion forecasting** -- Predict delivery dates based on historical velocity
- **Custom reports** -- Build dashboards tailored to your team's KPIs
- **Export options** -- Share reports in PDF or CSV format with stakeholders

</section>

<section class="data-section" aria-labelledby="team-heading">

## Team Performance Snapshot

Here is how your team is performing this week:

<div class="table-responsive">
<table class="data-table" aria-label="Team member performance this week">
  <thead>
    <tr>
      <th scope="col">Team Member</th>
      <th scope="col">Role</th>
      <th scope="col">Active Projects</th>
      <th scope="col">Tasks Completed This Week</th>
    </tr>
  </thead>
  <tbody>
    {%- for member in sample.team_members %}
    <tr>
      <td>{{ member.name }}</td>
      <td>{{ member.role }}</td>
      <td>{{ member.projects }}</td>
      <td><div class="bar-indicator" aria-label="{{ member.tasks_completed_this_week }} tasks"><div class="bar-fill" style="width: {{ (member.tasks_completed_this_week / 15 * 100) | round }}%"></div><span class="bar-value">{{ member.tasks_completed_this_week }}</span></div></td>
    </tr>
    {%- endfor %}
  </tbody>
</table>
</div>

</section>

<section class="metrics-summary" aria-labelledby="metrics-heading">

## Key Metrics at a Glance

<div class="grid-2 metrics-grid">
  <div class="metric-card">
    <span class="metric-value">{{ sample.analytics.tasks_completed_this_month }}</span>
    <span class="metric-label">Tasks Completed This Month</span>
  </div>
  <div class="metric-card">
    <span class="metric-value">{{ sample.analytics.on_time_delivery_rate }}</span>
    <span class="metric-label">On-Time Delivery Rate</span>
  </div>
  <div class="metric-card">
    <span class="metric-value">{{ sample.analytics.active_projects }}</span>
    <span class="metric-label">Active Projects</span>
  </div>
  <div class="metric-card">
    <span class="metric-value">{{ sample.analytics.team_velocity }}</span>
    <span class="metric-label">Team Velocity</span>
  </div>
</div>

</section>

<section class="feature-image-section" aria-label="Analytics illustration">

<img src="/assets/images/placeholder-feature.svg" alt="Bar chart showing team velocity trends over six weeks with increasing task completion" width="600" height="300">

</section>

<section class="cta-section" aria-labelledby="cta-heading">

## Make data-driven decisions

Unlock your team's full potential with insights that matter.

<a href="#" class="btn btn-primary btn-large">Try Team Analytics Free</a>

[Back to Home](/)

</section>
