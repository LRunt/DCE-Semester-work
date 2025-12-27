<script setup>
    import { useI18n } from 'vue-i18n';
    import { onMounted, watch } from 'vue';
    import { getProjects } from '../composables/projectService';
    import ProjectPreview from '../components/ProjectPreview.vue';
    const { locale, t } = useI18n();
    const { projects, loading, error, loadProjects } = getProjects();
    
    watch(locale, (newLang) => {
        loadProjects(newLang);
    });

    onMounted(() => {
        loadProjects(locale.value);
    });
</script>

<template>
    <div class="content-body">
        <h2 class="title">{{ t("projects.title") }}</h2>
        
        <div v-if="loading" class="status-msg">Načítání...</div>
        <div v-else-if="error" class="status-msg error">{{ error }}</div>
        
        <div v-else class="projects-container">
            <div v-for="(project, index) in projects" :key="project.id">
                <ProjectPreview 
                    :headline="project.name"
                    :description="project.description"
                    :image-path="project.img"
                />
                <hr v-if="index < projects.length - 1" />
            </div>
        </div>
    </div>
</template>