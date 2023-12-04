<template>
  <div class="about">
    <h1>Times</h1>
  
      <b-button type="submit" variant="primary" v-b-modal.modal-sort-match>SORTEAR TIMES</b-button>
      <br>
      <div v-if="loading" class="text-center">
        <b-spinner label="Spinning"></b-spinner>
      </div>

      <b-table v-else striped hover :items="teams" :fields="tableFields"></b-table>
  
      <match-form id="modal-sort-teams"/>
    </div>

</template>

<script setup>

  import { onMounted, ref } from 'vue';

  const loading = ref(false)
  const teams   = ref([])
  const tableFields   = ref([
 {
       key: 'name', 
       label: 'Nome'
  
      },
  
      {      
       key: 'match_quatity', 
       label: 'Quantidade de Partidas'
       
      },
   
     {
      key: 'player_quantity',
      label:'Quantidade de jogadores',

     } ,

    {
      key:'victories',
      label:'victories',
    },

     {
      key:'loses',
      label: 'loses',
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

    
