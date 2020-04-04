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

export default {
  data: function() {
    return {
      variables: [
                    ['Total a Pagar', '{{TOTAL_A_PAGAR}}'],
                    ['Nombre del Inversor', '{{NOMBRE_INVERSOR}}']
                 ]
    }
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
    }
  }
}

</script>

<style>

  .sidebar {
      padding: 15px;
      background-color: #fff;
      height: 25vh;
      color: #fff;
      background-color: #222;
      border: 1px solid #090909;
      border-radius: 4px;
      margin-right: 15px;
      text-transform: uppercase;
      /* position: -webkit-sticky; */
      position: sticky;
      top: 0;
  }
</style>