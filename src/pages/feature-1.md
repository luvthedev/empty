---
layout: base.html
title: Project Tracking
description: Track every project from kickoff to delivery with TaskFlow's visual project management tools.
---

<section class="page-header" aria-labelledby="page-heading">

# Project Tracking

Keep every project on course with real-time visibility into tasks, deadlines, and team workload.

</section>

<section class="feature-detail" aria-labelledby="overview-heading">

## How It Works

TaskFlow's project tracking gives your team a shared source of truth. Create projects, break them into tasks, assign owners, and watch progress unfold in real time. Whether you prefer boards, lists, or timelines, TaskFlow adapts to how your team works best.

### Key capabilities

- **Visual task boards** -- Drag-and-drop cards across customizable columns
- **Priority levels** -- Flag tasks as High, Medium, or Low to focus on what matters
- **Due date tracking** -- Never miss a deadline with automatic reminders
- **Progress indicators** -- See completion percentage at a glance
- **Owner assignment** -- Clear accountability for every deliverable

</section>

<section class="data-section" aria-labelledby="projects-heading">

## Active Projects

Here is a snapshot of current projects being managed in TaskFlow:

<div class="table-responsive">
<table class="data-table" aria-label="Active projects overview">
  <thead>
    <tr>
      <th scope="col">Project</th>
      <th scope="col">Owner</th>
      <th scope="col">Status</th>
      <th scope="col">Progress</th>
      <th scope="col">Priority</th>
      <th scope="col">Due Date</th>
    </tr>
  </thead>
  <tbody>
    {%- for project in sample.projects %}
    <tr>
      <td>{{ project.name }}</td>
      <td>{{ project.owner }}</td>
      <td><span class="status-badge status-{{ project.status | lower | replace(" ", "-") }}">{{ project.status }}</span></td>
      <td><div class="progress-bar" role="progressbar" aria-valuenow="{{ (project.tasks_completed / project.tasks_total * 100) | round }}" aria-valuemin="0" aria-valuemax="100" aria-label="{{ project.name }} progress"><div class="progress-fill" style="width: {{ (project.tasks_completed / project.tasks_total * 100) | round }}%"></div></div><span class="progress-text">{{ project.tasks_completed }}/{{ project.tasks_total }} tasks</span></td>
      <td><span class="priority-badge priority-{{ project.priority | lower }}">{{ project.priority }}</span></td>
      <td>{{ project.due_date }}</td>
    </tr>
    {%- endfor %}
  </tbody>
</table>
</div>

</section>

<section class="feature-image-section" aria-label="Feature illustration">

<img src="/assets/images/placeholder-feature.svg" alt="Bar chart showing weekly task completion trends across a six-week sprint" width="600" height="300">

</section>

<section class="cta-section" aria-labelledby="cta-heading">

## Start tracking your projects today

Set up your first project in under two minutes. No credit card required.

<a href="#" class="btn btn-primary btn-large">Try Project Tracking Free</a>

[Back to Home](/)

</section>
