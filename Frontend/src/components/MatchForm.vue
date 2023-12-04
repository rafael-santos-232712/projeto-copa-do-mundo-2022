<template>
  <b-modal hide-footer title="Sorteio Time">
    <b-form @submit="onSubmit" @reset="onReset">
      <b-form-group
        id="input-group-1"
        label="Time de casa"
        label-for="input-1"
      >
        <b-form-select required v-model="form.team_house_id" :options="teamOptions"></b-form-select>
      </b-form-group>
      <b-form-group
        id="input-group-1"
        label="Time Visitante"
        label-for="input-1"
      >
        <b-form-select required v-model="form.team_outside_id" :options="teamOptions"></b-form-select>
      </b-form-group>
      
      <b-card-footer class="pt-3">
        <b-button type="submit" class="mx-auto" variant="success">Enviar</b-button>
        <b-button type="reset"  class="mx-auto" variant="danger">Reset</b-button>
      </b-card-footer>
    </b-form>
  </b-modal>
</template>

<script setup>
import { ref, computed, onBeforeMount } from "vue"

const form    = ref({})
const teams   = ref([])
const loading = ref(false)

const onSubmit = async function() {
  const response = await fetch('/api/matches', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({match: form.value})
  });
}

const onReset = async function() {
  form.value = {}
}

const teamOptions = computed(() => [
  { value: null, text: 'Selecione uma opção ae!!' },
  ...teams.value.map((team) => ({ value: team.id, text: team.name })),
])

const getTeams = async function() {
  loading.value = true

  try {
    const response = await fetch("/api/teams.json")
    teams.value = await response.json()
  } catch (error) {
    console.log("Deu erro aqui:", error)
  }

  loading.value = false
}

onBeforeMount(() => {
  getTeams()
})
</script>