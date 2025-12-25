<script setup>
import zcu_logo from '../assets/images/education/zcu.jpg';
import unisa_logo from '../assets/images/education/unisa.jpg';
import sps_logo from '../assets/images/education/sps_chomutov.png';
import { useI18n } from 'vue-i18n';

useI18n();
</script>

<template>
    <div class="mb-5 mt-5">
        <h2 id="education" class="mb-4">{{ $t('navbar.education') }}</h2>

        <div class="row mb-4">
          <div class="timeline-col">
              <div class="muted">2024 - {{ $t('time.present') }}</div>
          </div>
          <div class="col-md-9 d-flex align-items-center">
            <img v-bind:src="zcu_logo" class="logo" alt="logo Západočeské univerity v Plzni">
            <div>
              <h3>ZČU - {{ $t('education.faculty') }}</h3>
              <p>{{ $t('education.master') }}, {{ $t('education.softwareEngineering') }}</p>
            </div>
          </div>
        </div>  

        <div class="row mb-4">
          <div class="timeline-col">
              <div class="muted">2023 - 2023</div>
          </div>
          <div class="col-md-9 d-flex align-items-center">
            <img v-bind:src="unisa_logo" class="logo" alt="logo Università degli Studi di Salerno">
            <div>
              <h3>Università degli Studi di Salerno</h3>
              <p>Program Erasmus+, Computer Science</p>
            </div>
          </div>
        </div>

        <div class="row mb-4">
            <div class="timeline-col">
                <div class="muted">2020 - 2024</div>
            </div>
            <div class="col-md-9 d-flex align-items-center">
                <img v-bind:src="zcu_logo" class="logo" alt="logo Západočeské univerity v Plzni">
                <div>
                  <h3>ZČU - {{ $t('education.faculty') }}</h3>
                  <p>{{ $t('education.bachelor') }}, {{ $t('education.informatics') }}</p>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="timeline-col">
                <div class="muted">2016 - 2020</div>
            </div>
            <div class="col-md-9 d-flex align-items-center">
                <img v-bind:src="sps_logo" class="logo" alt="logo školy SPŠ a VOŠ Chomutov">
                <div>
                  <h3>SPŠ a VOŠ Chomutov</h3>
                  <p>{{ $t('education.automation') }}</p>
                </div>
            </div>
        </div>
      </div>
</template>