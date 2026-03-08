---
layout: base.html
title: Project Boards
description: "Visual project boards that give your team a clear view of every task, owner, and deadline."
---

<section class="page-header">
  <nav class="breadcrumb" aria-label="Breadcrumb">
    <a href="/">Home</a> <span aria-hidden="true">/</span> <span>Project Boards</span>
  </nav>
  <h1>Visual Project Boards</h1>
  <p class="page-header__subtitle">See every project, every task, and every deadline in one place. Drag, drop, and get things done.</p>
</section>

<section class="feature-detail">
  <div class="feature-detail__image">
    <img src="/assets/images/placeholder-hero.svg" alt="Project board interface showing tasks organized in columns by status — To Do, In Progress, and Done" width="800" height="400">
  </div>

  <h2>How it works</h2>
  <p>TaskFlow boards give your team a shared workspace where tasks move through stages — from planning to completion. Each card represents a task with an owner, due date, and priority level, so everyone knows what needs attention.</p>

  <h3>Use cases</h3>
  <ul>
    <li><strong>Sprint planning</strong> — Break down features into tasks, assign owners, and set deadlines for each sprint cycle.</li>
    <li><strong>Product launches</strong> — Coordinate across marketing, engineering, and design with a single board everyone can see.</li>
    <li><strong>Client projects</strong> — Track deliverables, share progress with stakeholders, and keep budgets on target.</li>
  </ul>
</section>

<section class="data-showcase" aria-label="Active projects">
  <h2>Active Projects</h2>
  <p>Here's a snapshot of projects currently being tracked in TaskFlow:</p>

  <div class="table-responsive">
    <table>
      <caption class="sr-only">Current project status across the team</caption>
      <thead>
        <tr>
          <th scope="col">Project</th>
          <th scope="col">Owner</th>
          <th scope="col">Status</th>
          <th scope="col">Progress</th>
          <th scope="col">Due Date</th>
          <th scope="col">Priority</th>
        </tr>
      </thead>
      <tbody>
        {%- for project in sample.projects %}
        <tr>
          <td>{{ project.name }}</td>
          <td>{{ project.owner }}</td>
          <td><span class="badge badge--{{ project.status | lower | replace(' ', '-') }}">{{ project.status }}</span></td>
          <td>
            <div class="progress-bar" role="progressbar" aria-valuenow="{{ ((project.tasks_completed / project.tasks_total) * 100) | round }}" aria-valuemin="0" aria-valuemax="100" aria-label="{{ project.tasks_completed }} of {{ project.tasks_total }} tasks completed">
              <div class="progress-bar__fill" style="width: {{ ((project.tasks_completed / project.tasks_total) * 100) | round }}%"></div>
            </div>
            <span class="progress-text">{{ project.tasks_completed }}/{{ project.tasks_total }}</span>
          </td>
          <td>{{ project.due_date }}</td>
          <td><span class="badge badge--priority-{{ project.priority | lower }}">{{ project.priority }}</span></td>
        </tr>
        {%- endfor %}
      </tbody>
    </table>
  </div>
</section>

<section class="cta">
  <h2>Start organizing your projects</h2>
  <p>Create your first board in under a minute. No credit card required.</p>
  <a href="#" class="btn btn--primary">Try Project Boards</a>
</section>
