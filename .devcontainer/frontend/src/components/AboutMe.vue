<script setup>
import me from '../assets/images/me.webp';
import { useI18n } from 'vue-i18n';

useI18n();
</script>

<template>
    <div class="half-page">
    <div class="container-fluid">
        <div class="row g-4">
            <div class="col-12 col-md-6">
                <div class="p-4 intro">
                    <h2 class="about-me-title">{{ $t('aboutMe.title') }}</h2>
                    <p class="about-me">{{ $t('aboutMe.content') }}</p>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="p-4 text-center">
                    <img v-bind:src="me" alt="My portrait" class="rounded-circle profile-image"> 
                </div>
            </div>
        </div>
    </div>
    </div>
</template>