import { ref, watch } from 'vue'

const isDark = ref(false)

export function useTheme() {
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme) {
    isDark.value = savedTheme === 'dark'
  } else {
    isDark.value = window.matchMedia('(prefers-color-scheme: dark)').matches
  }

  applyTheme()

  watch(isDark, () => {
    applyTheme()
    localStorage.setItem('theme', isDark.value ? 'dark' : 'light')
  })

  function applyTheme() {
    if (isDark.value) {
      document.documentElement.setAttribute('data-theme', 'dark')
      document.body.classList.add('dark-theme')
    } else {
      document.documentElement.setAttribute('data-theme', 'light')
      document.body.classList.remove('dark-theme')
    }
  }

  function toggleTheme() {
    isDark.value = !isDark.value
  }

  return {
    isDark,
    toggleTheme
  }
}