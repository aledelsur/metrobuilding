<template>
  <div class='col-xs-12 col-sm-12 col-md-2 sidebar'>
    <h6 class="text-center">Variables Personalizadas</h6>
    <div class="text-center">

      <div v-for="(variable, index) in variables">
        <button type="button" class="btn btn-default" @click="copyToClipboard(variable[1])"> {{ variable[0] }} </button>

        <br />
        <br />
      </div>

    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      variables: []
    }
  },
  mounted: function(){
    axios({ method: 'get',
            url: '/admin/newsletter_variables.json'
          })
    .then(response => {
      this.variables = response.data
    })
  },
  methods: {
    copyToClipboard(value) {

      // Este codigo crea un elemento html textarea, le asigna un value, lo copia y lo borra.
      // Lo hace de forma muy rapida y es imperciptible

      var dummy = document.createElement("textarea")
      document.body.appendChild(dummy)
      dummy.value = value
      dummy.select()
      document.execCommand("copy")
      document.body.removeChild(dummy)

      this.$root.notify({
        group: 'alerts',
        type: 'info',
        title: 'Copiar',
        text: 'Variable copiada al portapapeles'
      });
    }
  }
}

</script>

<style scoped>

  .sidebar {
      padding: 15px;
      background-color: #fff;
      height: 25vh;
      color: #000;
      background-color: #f5f5f5;
      border: 1px solid #ddd;
      border-radius: 4px;
      margin-right: 15px;
      text-transform: uppercase;
      /* position: -webkit-sticky; */
      position: sticky;
      top: 0;
  }
</style>
