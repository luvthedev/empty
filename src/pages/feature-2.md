---
layout: base.html
title: Analytics
description: "Real-time analytics and reporting for project teams. Track velocity, completion rates, and workload distribution."
---

<section class="page-header">
  <nav class="breadcrumb" aria-label="Breadcrumb">
    <a href="/">Home</a> <span aria-hidden="true">/</span> <span>Analytics</span>
  </nav>
  <h1>Real-Time Analytics</h1>
  <p class="page-header__subtitle">Turn project data into clear insights. Track what matters and spot issues before they become problems.</p>
</section>

<section class="feature-detail">
  <div class="feature-detail__image">
    <img src="/assets/images/placeholder-feature.svg" alt="Analytics dashboard showing bar charts and trend lines for project completion rates over time" width="600" height="300">
  </div>

  <h2>Make decisions with data, not guesses</h2>
  <p>TaskFlow Analytics collects data from your project boards automatically and turns it into actionable dashboards. No manual reporting, no exporting to spreadsheets — just open the analytics view and see where your team stands.</p>

  <h3>Use cases</h3>
  <ul>
    <li><strong>Sprint retrospectives</strong> — Review velocity trends and task completion rates to identify what's working and what needs adjustment.</li>
    <li><strong>Resource planning</strong> — See which team members are overloaded and redistribute work before burnout hits.</li>
    <li><strong>Executive reporting</strong> — Generate summary views of all active projects for stakeholder updates without pulling data from five different tools.</li>
  </ul>
</section>

<section class="data-showcase" aria-label="Team performance overview">
  <h2>Team Performance Overview</h2>
  <p>A summary of your team's current project metrics:</p>

  <div class="metrics-grid">
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.total_projects }}</span>
      <span class="metric-card__label">Total Projects</span>
    </div>
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.active_projects }}</span>
      <span class="metric-card__label">Active Projects</span>
    </div>
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.completed_projects }}</span>
      <span class="metric-card__label">Completed</span>
    </div>
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.team_members }}</span>
      <span class="metric-card__label">Team Members</span>
    </div>
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.tasks_completed_this_month }}</span>
      <span class="metric-card__label">Tasks This Month</span>
    </div>
    <div class="metric-card">
      <span class="metric-card__value">{{ sample.team_stats.on_time_delivery_rate }}</span>
      <span class="metric-card__label">On-Time Rate</span>
    </div>
  </div>
</section>

<section class="data-showcase" aria-label="Project breakdown">
  <h2>Project Breakdown</h2>
  <p>Detailed status for each tracked project:</p>

  <div class="project-list">
    {%- for project in sample.projects %}
    <div class="project-list__item">
      <div class="project-list__header">
        <h3>{{ project.name }}</h3>
        <span class="badge badge--{{ project.status | lower | replace(' ', '-') }}">{{ project.status }}</span>
      </div>
      <div class="project-list__details">
        <span><strong>Owner:</strong> {{ project.owner }}</span>
        <span><strong>Due:</strong> {{ project.due_date }}</span>
        <span><strong>Priority:</strong> {{ project.priority }}</span>
      </div>
      <div class="project-list__progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="{{ ((project.tasks_completed / project.tasks_total) * 100) | round }}" aria-valuemin="0" aria-valuemax="100" aria-label="{{ project.tasks_completed }} of {{ project.tasks_total }} tasks completed">
          <div class="progress-bar__fill" style="width: {{ ((project.tasks_completed / project.tasks_total) * 100) | round }}%"></div>
        </div>
        <span class="progress-text">{{ project.tasks_completed }} of {{ project.tasks_total }} tasks completed</span>
      </div>
    </div>
    {%- endfor %}
  </div>
</section>

<section class="cta">
  <h2>See your team's real numbers</h2>
  <p>Connect your projects and get analytics in minutes. Free for teams up to 5.</p>
  <a href="#" class="btn btn--primary">Try Analytics</a>
</section>
