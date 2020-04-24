<template>
  <div class="show-btn">
    <b-button id="show-btn " variant="success" v-on:click="showMediaAssets">Administrar imágenes</b-button>

    <b-modal ref="my-modal" hide-footer title="Imágenes">
      <div v-for="asset in mediaAssets">
        <div class='single-image text-center col-md-4'>
          <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded section-img"></b-img>
          <button class="btn btn-primary add-button" v-on:click="addAssetToSection(asset.id)" v-if="!asset.is_added">Agregar</button>
          <button class="btn btn-danger delete-button" v-on:click="removeAssetFromSection(asset.id)" v-else>Eliminar</button>
        </div>
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: ['section'],
  data: function(){
    return {
      newsletter_id: null,
      mediaAssets: []
    }
  },
  methods: {
    showMediaAssets(){
      this.$refs['my-modal'].show();

      axios({ method: 'get',
              url: '/admin/media_assets.json',
              params: { newsletter_section_id: this.section.id }})
      .then(response => {
        console.log('assets: ')
        console.log(response.data)
        this.mediaAssets = response.data
      })
    },

    addAssetToSection(assetId) {
      axios({ method: 'put',
              url: '/admin/newsletters/' + this.section.newsletter_id + '/newsletter_sections/' + this.section.id + '/add_media_asset',
              params: { id: assetId }})
      .then(response => {
        this.mediaAssets = response.data
        this.reloadMediaAssets();
      })
    },

    removeAssetFromSection(assetId) {
      axios({ method: 'delete',
              url: '/admin/newsletters/' + this.section.newsletter_id + '/newsletter_sections/' + this.section.id + '/remove_media_asset',
              params: { id: assetId }})
      .then(response => {
        this.mediaAssets = response.data
        this.reloadMediaAssets();
      })
    },

    reloadMediaAssets() {
      axios({ method: 'get',
              url: '/admin/newsletters/' + this.section.newsletter_id + '/newsletter_sections/' + this.section.id + '/media_assets' })
      .then(response => {
        this.$parent.$parent.sectionAssets = response.data
      })
    }
  }
}
</script>

<style>
  .modal-body{
    height: 85%;
    overflow-y: auto;
  }
  .modal-dialog {
    margin-top: 17%;
    overflow-y: initial !important;
    width: 75%;
  }
  .modal-dialog img.section-img{
    width: 200px;
    height: 200px;
    margin: 5px;
  }
  .modal-dialog .modal-content {
    min-height: 700px;
  }
  .add-button, .delete-button{
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  .show-btn{
    margin-top: 10px;
  }
</style>
