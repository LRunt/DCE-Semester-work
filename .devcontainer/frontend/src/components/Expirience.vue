<script setup>
import eurosoftware_logo from '../assets/images/jobs/eurosoftware_logo.jpg';
import { useI18n } from 'vue-i18n';

useI18n();
</script>

<template>
    <div class="mb-5">
        <h2 id="work-experience" class="mb-4 mt-5" >{{ $t('navbar.workExperience') }}</h2>
          
        <div class="row mb-4">
          <div class="timeline-col">
              <div class="muted">2025 - {{ $t('time.present') }}</div>
          </div>
          <div class="col-md-9 d-flex align-items-center">
            <img v-bind:src="eurosoftware_logo" class="logo" alt="logo Eurosoftware">
            <div>
              <h3>Eurosoftware - Junior Developer</h3>
              <p>{{ $t('expirience.halfTime') }}</p>
            </div>
          </div>
        </div>

        <div class="row mb-4">
          <div class="timeline-col">
            <div class="muted">2022 - 2025</div>
          </div>
          <div class="col-md-9 d-flex align-items-center">
            <img v-bind:src="eurosoftware_logo" class="logo" alt="logo Eurosoftware">
            <div>
              <h3>Eurosoftware - Future Lab & Students Lab</h3>
              <p>{{ $t('expirience.partTime') }}, {{ $t('expirience.internApplications') }}</p>
            </div>
          </div>
        </div>
    </div>
</template>