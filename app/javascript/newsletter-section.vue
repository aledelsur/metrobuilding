<template>
  <div>

      <div class="panel panel-default newsletter-section">
        <div class="panel-heading grabbable" @click='visible = !visible'>
          {{ title }}
          <span></span>
        </div>
        <b-collapse v-model="visible" class="mt-2">
          <b-card>
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
              <b-button id="show-btn" @click="showModal">Open Modal</b-button>

              <b-modal ref="my-modal" hide-footer title="Using Component Methods">
                <div class="d-block text-center">
                  <h3> Welcome to section  {{ id }}</h3>
                </div>
              </b-modal>

              <!-- <label class="custom-file-label">Agregar imágenes</label> -->

            </div>
          </div>
          </b-card>
        </b-collapse>
      </div>
  </div>
</template>

<script>
import VueCkeditor from 'vue-ckeditor2';
// Vue.use(IconsPlugin)
// import './custom.scss'
// import { ModalPlugin } from 'bootstrap-vue'
// Vue.use(ModalPlugin)
// import MediaAssetLibrary from './media-asset-library.vue'
import Vue from 'vue'

export default {
  props: ['section'],
  name: 'newsletter-section',
  components: {VueCkeditor},
  data: function () {
    return {
      id: 0,
      position: 1,
      title: null,
      description: '<p>Rich-text editor content.</p>',
      mediaAssets: [],
      visible: false,
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
    this.id = this.section.id
    this.title = this.section.title
    this.description = this.section.description
    this.position = this.section.position
  },
  methods:  {
    modalId(){
      var id = ('section-' + this.id);
      console.log('The id is')
      console.log(id)

      return id;
    },
    showModal(){
      this.$refs['my-modal'].show();
    }
  }
}
</script>

<style>
.fade {
  opacity: 1;
}
</style>