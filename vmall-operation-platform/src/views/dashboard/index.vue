<template>
  <div class="dashboard-container">
    <!--    <component :is="currentRole" />-->
    <adminDashboard />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import adminDashboard from './admin'
// import editorDashboard from './editor'

export default {
  name: 'Dashboard',
  components: { adminDashboard/*, editorDashboard*/ },
  data() {
    return {
      currentRole: 'ROLE_admin'
    }
  },
  computed: {
    ...mapGetters([
      'roles'
    ])
  },
  created() {
    if (!this.roles.includes('ROLE_admin')) {
      this.currentRole = 'editorDashboard'
    }
  }
}
</script>
