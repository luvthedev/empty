---
layout: base.html
title: Home
description: "TaskFlow — Project management that keeps your team aligned, focused, and delivering on time."
permalink: /
---

<section class="hero">
  <div class="hero__text">
    <h1>Ship projects on time, every time</h1>
    <p class="hero__tagline">TaskFlow gives your team a clear view of every project, task, and deadline — so nothing slips through the cracks.</p>
    <a href="/pages/feature-1/" class="btn btn--primary">See How It Works</a>
    <a href="/pages/feature-2/" class="btn btn--outline">View Analytics</a>
  </div>
  <div class="hero__image">
    <img src="/assets/images/placeholder-hero.svg" alt="TaskFlow dashboard showing project boards with task cards organized into columns for To Do, In Progress, and Done" width="800" height="400">
  </div>
</section>

<section class="features" aria-label="Feature highlights">
  <h2 class="section-heading">Everything your team needs</h2>
  <div class="feature-grid">
    <div class="feature-card">
      <h3>Visual Project Boards</h3>
      <p>Organize tasks into customizable boards with drag-and-drop columns. See who's working on what and where things stand at a glance.</p>
      <a href="/pages/feature-1/">Learn more &rarr;</a>
    </div>
    <div class="feature-card">
      <h3>Real-Time Analytics</h3>
      <p>Track velocity, completion rates, and team workload with dashboards that update automatically. Make data-driven decisions without the spreadsheet gymnastics.</p>
      <a href="/pages/feature-2/">Learn more &rarr;</a>
    </div>
    <div class="feature-card">
      <h3>Team Collaboration</h3>
      <p>Comment on tasks, share files, and get notified when things change. Keep conversations in context instead of buried in email threads.</p>
    </div>
  </div>
</section>

<section class="stats" aria-label="Platform statistics">
  <h2 class="section-heading">Trusted by teams that deliver</h2>
  <div class="stats-grid">
    <div class="stat">
      <span class="stat__number">{{ sample.team_stats.on_time_delivery_rate }}</span>
      <span class="stat__label">On-time delivery rate</span>
    </div>
    <div class="stat">
      <span class="stat__number">{{ sample.team_stats.tasks_completed_this_month }}</span>
      <span class="stat__label">Tasks completed this month</span>
    </div>
    <div class="stat">
      <span class="stat__number">{{ sample.team_stats.active_projects }}</span>
      <span class="stat__label">Active projects</span>
    </div>
  </div>
</section>

<section class="cta">
  <h2>Ready to get your team on track?</h2>
  <p>Start managing projects with clarity. Free for teams up to 5 members.</p>
  <a href="#" class="btn btn--primary btn--lg">Get Started Free</a>
</section>
