<script setup>
  import { useI18n } from 'vue-i18n'

  const { locale } = useI18n()
</script>

<template>
    
    <footer class="text-center text-lg-start footer muted">
      <section class="mb-0">
        <div class="container text-center text-md-start mt-2 p-0">
          <div class="row mt-0 p-0">
            <!-- Grid columns -->
            <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mb-0 p-0">
              <!-- Content -->
              <h6 class="text-center text-uppercase fw-bold mb-2">
                <i class="fas fa-phone me-3"></i>{{ $t('footer.phone') }}
              </h6>
              <p>+420 606 320 412</p>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mb-2 p-0">
              <h6 class="text-center text-uppercase fw-bold mb-2">
                <i class="fas fa-envelope me-3"></i>{{ $t('footer.mail') }}
              </h6>
              <p>lukas.runt@gmail.com</p>        
            </div>
            <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mb-2 p-0">
              <h6 class="text-center text-uppercase fw-bold mb-2">
                <i class="fas fa-link me-3"></i>{{ $t('footer.followMe') }}
              </h6>
              <div class="text-center">
                <a href="https://www.instagram.com/lukas_runt/" role="button"><i class="fab fa-instagram me-2"></i></a>
                <a href="https://www.facebook.com/profile.php?id=100005716547788" role="button"><i class="fab fa-facebook-f me-2"></i></a>
                <a href="https://www.linkedin.com/in/luk%C3%A1%C5%A1-runt-612692236/" role="button"><i class="fab fa-linkedin me-2"></i></a>
                <a href="https://github.com/LRunt" role="button"><i class="fab fa-github me-2"></i></a>
                <a href="https://www.strava.com/athletes/33986825" role="button"><i class="fab fa-strava me-2"></i></a>
              </div>    
            </div>
          </div>
        </div>
      </section>
      <div class="me-2">
        <hr>
      </div>
      <!-- Copyright -->
      <div class="text-center p-2">
      © 2025 Copyright: <a class="text-reset fw-bold" href="https://github.com/LRunt">Lukas Runt</a>
      </div>
      <!-- Copyright -->
    </footer>

</template>