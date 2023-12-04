<template>
  <div class="about">
    <h1>Partidas</h1>

    <b-button type="submit" variant="primary" v-b-modal.modal-sort-match>SORTEAR PARTIDA</b-button>
    <br>
    <div v-if="loading" class="text-center">
      <b-spinner label="Spinning"></b-spinner>
    </div>
    <b-table v-else striped hover :items="matches" :fields="tableFields"></b-table>

    <match-form id="modal-sort-match"/>
  </div>
</template>
<script setup>
  import { ref, onMounted } from 'vue'
  import MatchForm from '../components/MatchForm.vue';

  const matches = ref([])
  const match = ref({})
  const loading = ref(false)

  const tableFields = [
    {
      key: 'team_house_id',
      label: 'Time da Casa',
      sortable: true,
    },
    {
      key: 'team_outside_id',
      label: 'Time Visitante',
      sortable: true,
    }
  ]

  const getMatches = async function() {
    loading.value = true

    try {
      const response = await fetch("/api/matches.json")
      matches.value = await response.json()
    } catch (error) {
      console.log("Deu erro aqui:", error)
    }

    loading.value = false
  }

  const saveMatch = async function() {
    const response = await fetch('/api/matches', { method: "POST" }) 
  }

  onMounted(() => {
    getMatches()
  })
</script>

<style>
</style>
