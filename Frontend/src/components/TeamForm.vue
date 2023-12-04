<template>
    <b-modal hide-footer v-model="show" :title="isEdition ? 'Editar Time' : 'Adicionar Time'">
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
          <b-button type="submit" class="mx-auto" variant="success">{{ isEdition ? 'Editar Time' : 'Adicionar Time' }}</b-button>
          <b-button type="reset"  class="mx-auto" variant="danger">Limpar Campos</b-button>
        </b-card-footer>
      </b-form>
    </b-modal>
  </template>
  
  <script setup>
  import { computed, defineEmits, defineProps, ref } from "vue"
  
  const props = defineProps({
    form: {
      type: Object,
      default: () => ({})
    },
  })

  const emit = defineEmits(['input', 'saved'])

  const show = ref(false)

  const form = computed({
    get: () => props.form,
    set: (val) => emit('input', val)
  })

  const isEdition = computed(() => !!form.value.id)
  
  const onSubmit = async function() {
    if (isEdition.value) {
      await fetch('/api/teams/' + form.value.id, {
        method: 'PATCH',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ team: form.value })
      });
    } else {
      await fetch('/api/teams', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ team: form.value })
      });
    }

    show.value = false
    emit('saved')
  }
  
  const onReset = async function() {
    form.value = {}
  }
</script>
