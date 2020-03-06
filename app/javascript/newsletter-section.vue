<template>
  <div class="panel panel-default newsletter-section ui-sortable-handle" data-id="" id="new_newsletter_section">
    <div class="panel-heading">
      Sección {{ position }} - {{ title }}
      <span></span>
    </div>
    <div class="panel-body">
      <div class="form-group">
        <label for="newsletter_newsletter_sections_attributes_0_title"> Tītulo de la sección </label>
        <input class="form-control" type="text" v-model="title">
      </div>

      <div class="form-group">
        <label for="newsletter_newsletter_sections_attributes_0_description">Descripción de la sección</label>

        <vue-ckeditor
        v-model="description"
        :config="config" />

      </div>

      <div class="form-group">
        <label class="custom-file-label">Agregar imágenes</label>
        <input multiple="multiple" type="file" name="newsletter[newsletter_sections_attributes][0][images][]" id="newsletter_newsletter_sections_attributes_0_images">
      </div>
    </div>
  </div>
</template>

<script>
import VueCkeditor from 'vue-ckeditor2';

export default {
  props: ['section'],
  name: 'newsletter-section',
  components: {VueCkeditor},
  data: function () {
    return {
      position: 1,
      title: null,
      description: '<p>Rich-text editor content.</p>',
      config: {
        toolbar: [
          // { name: 'document', items: [ '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
          // { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
          // { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
          // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
          // '/',
          { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'CopyFormatting', 'RemoveFormat' ] },
          { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
          { name: 'links', items: [ 'Link', 'Unlink' ] },
          { name: 'insert', items: [ 'Table', 'HorizontalRule' ] },
          '/',
          { name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
          { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
          { name: 'tools', items: [ 'Maximize' ] }
          // { name: 'about', items: [ 'About' ] }
        ],
        height: 300
      }
    }
  },
  mounted: function() {
    this.title = this.section.title
    this.description = this.section.description
    this.position = this.section.position
  },
  methods:  {

  }
}
</script>

<style>
</style>