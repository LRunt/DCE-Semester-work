<script setup>
  import { useTheme } from '@/composables/useThemes';
  import czechia from '../assets/images/flags/czech-republic.png';
  import unitedKingdom from '../assets/images/flags/united-kingdom.png';
  import { useI18n } from 'vue-i18n'

  const { locale } = useI18n()
  const { isDark, toggleTheme} = useTheme();

  const toggleLanguage = () => {
    locale.value = locale.value === 'cs' ? 'en' : 'cs'
  }

  const scrollToTop = () => {  
    window.scrollTo({ top: 0, behavior: 'smooth' })  
  }
</script>

<template>
    <header class="navbar navbar-expand-lg footer fixed-top"
      :class="isDark ? 'navbar-dark' : 'navbar-light'">
      <div class="container-fluid">
        <router-link class="navbar-brand" to="/" @click="scrollToTop">{{ $t('navbar.brand') }}</router-link>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <router-link class="nav-link" to="/#work-experience">{{ $t('navbar.workExperience') }}</router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to="/#education">{{ $t('navbar.education') }}
              </router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to="/sport">{{ $t('navbar.sport') }}
              </router-link>
            </li>

            <!-- Language switch for mobile phones -->  
            <li class="nav-item d-lg-none">  
              <hr class="dropdown-divider my-2">  
            </li>  
            <li class="nav-item d-lg-none">  
              <a class="nav-link d-flex align-items-center" href="#" @click.prevent="toggleLanguage">  
                <img :src="locale === 'cs' ? unitedKingdom : czechia"    
                     :alt="locale === 'cs' ? 'English' : 'Čeština'"  
                     class="flag-image me-2">  
                {{ locale === 'cs' ? 'English' : 'Čeština' }}  
              </a>  
            </li>
            <li class="nav-item d-lg-none">    
              <a class="nav-link d-flex align-items-center" href="#" @click.prevent="toggleTheme">    
                <i :class="isDark ? 'fas fa-sun' : 'fas fa-moon'" class="theme-icon me-2"></i>  
                {{ isDark ? $t('navbar.lightMode') : $t('navbar.darkMode') }}    
              </a>  
            </li>
          </ul>
          <ul class="navbar-nav ms-auto d-none d-lg-flex">
            <li class="nav-item">  
              <i @click="toggleTheme"   
                :class="isDark ? 'fas fa-sun' : 'fas fa-moon'"   
                class="theme-icon me-3"></i>  
            </li>
            <li class="nav-item">
              <img @click="toggleLanguage"   
                  :src="locale === 'cs' ? unitedKingdom : czechia"  
                  :alt="locale === 'cs' ? 'Switch to English' : 'Přepnout na češtinu'"    
                  class="flag-image">
            </li>
          </ul>
        </div>
      </div>
    </header>
</template>