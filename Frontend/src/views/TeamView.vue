<template>
  <div class="about">
    <h1>Times</h1>
  
    <b-button type="submit" variant="primary" v-b-modal.modal-team-form>SORTEAR TIMES</b-button>
    <br>

    <div v-if="loading" class="text-center">
      <b-spinner label="Spinning"></b-spinner>
    </div>

    <b-table v-else striped hover :items="teams" :fields="tableFields">
      <template #cell(actions)="row">
        <b-dropdown size="sm" text="Ações" class="m-2">
          <b-dropdown-item href="#" @click="form = row.item" v-b-modal.modal-team-form>Editar</b-dropdown-item>
          <b-dropdown-item href="#">Excluir</b-dropdown-item>
        </b-dropdown>
      </template>
    </b-table>

    <team-form :form="form" @input="form = event" @saved="getTeams" id="modal-team-form"/>
  </div>
</template>

<script setup>
  import { onMounted, ref } from 'vue';
  import TeamForm from '../components/TeamForm.vue';

  const form    = ref({})
  const loading = ref(false)
  const teams   = ref([])
  const tableFields   = ref([
    {
      key: 'name', 
      label: 'Nome'
    },
    {      
      key: 'match_quatity', 
      label: 'Quantidade de Partidas',
    },
    {
      key: 'player_quantity',
      label:'Quantidade de jogadores',
    } ,
    {
      key:'victories',
      label:'Vitorias',
    },
    {
      key:'loses',
      label: 'Derrotas',
    }, 
    {
      key: 'actions',
      label: 'Ações'
    }
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
  
  onMounted(() => {
    getTeams()
  })
</script>

<style>
</style>

    
