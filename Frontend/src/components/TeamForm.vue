<template>
    <b-modal hide-footer title="Adicionar jogador">
      <b-form @submit="onSubmit" @reset="onReset">
        <b-form-group
          id="input-group-1"
          label="Nome do Time"
          label-for="input-1"
        >
          <b-form-input required v-model="form.name"></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-2"
          label="vitórias"
          label-for="input-2"
        >
          <b-form-input required type="number" v-model="form.victories"></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Derrotas"
          b-form-group
          label-for="input-3"
        >
          <b-form-input required type="number" v-model="form.loses"></b-form-input>
        </b-form-group>
        
        <b-card-footer class="pt-3">
          <b-button type="submit" class="mx-auto" variant="success">Adicionar</b-button>
          <b-button type="reset"  class="mx-auto" variant="danger">Excluir</b-button>
        </b-card-footer>
      </b-form>
    </b-modal>
  </template>
  
  <script setup>
  import { ref } from "vue"
  
  const form = ref({})
  
  const onSubmit = async function() {
    await fetch('/api/teams', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ team: form.value })
    });
  }
  
  const onReset = async function() {
    form.value = {}
  }
</script>
