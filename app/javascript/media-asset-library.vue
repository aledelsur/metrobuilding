<template>
  <div class="show-btn">
    <b-button id="show-btn " variant="info" v-on:click="showMediaAssets">Administrar imágenes</b-button>

    <b-modal ref="my-modal" :title="modalTitle" ok-only ok-title="Cerrar">
      <div class="library">
        <div v-for="asset in mediaAssets">
          <div class='single-image col-md-4'>
            <div class='image-container'>
              <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded section-img"></b-img>
            </div>
            <button class="btn btn-success add-button" v-on:click="addAssetToSection(asset.id)" v-if="!asset.is_added">Agregar</button>
            <button class="btn btn-danger delete-button" v-on:click="removeAssetFromSection(asset.id)" v-else>Eliminar</button>
          </div>
        </div>
      </div>
      <div class='clear'></div>
      <div class='container'>
        <pagination
            v-if="showPagination"
           :total-pages="totalPages"
           :total="total"
           :per-page="perPage"
           :current-page="currentPage"
           @pagechanged="onPageChange"
         />
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';
import Pagination from './pagination.vue'

export default {
  props: ['section'],
  data: function(){
    return {
      newsletter_id: null,
      mediaAssets: [],
      currentPage: 1,
      totalPages: null,
      total: null,
      perPage: 6,
      showPagination: false,
      modalTitle: 'Imágenes'
    }
  },
  components: {
    Pagination
  },
  methods: {
    onPageChange(page) {
      this.fetchMediaAssets(page)
    },
    showMediaAssets(){
      this.$refs['my-modal'].show();

      this.fetchMediaAssets(1)
    },

    addAssetToSection(assetId) {
      axios({ method: 'put',
              url: this.baseURL() + '/add_media_asset',
              params: { id: assetId }})
      .then(response => {
        this.$parent.$parent.reloadSectionAssets();
        this.fetchMediaAssets(this.currentPage)
      })
    },

    removeAssetFromSection(assetId) {
      axios({ method: 'delete',
              url: this.baseURL() + '/remove_media_asset',
              params: { id: assetId }})
      .then(response => {
        this.$parent.$parent.reloadSectionAssets();
        this.fetchMediaAssets(this.currentPage)
      })
    },
    fetchMediaAssets(page) {
      axios({ method: 'get',
              url: '/admin/media_assets.json',
              params: { newsletter_section_id: this.section.id,
                        pagination: true, per_page: this.perPage,
                        current_page: page}
            })
      .then(response => {
        this.mediaAssets = response.data.serialized_records
        console.log(response.data)
        this.total = response.data.total
        this.totalPages = response.data.total_pages
        this.currentPage = response.data.current_page
        this.showPagination = true
        this.modalTitle = "Imágenes (" + this.total + " imágenes disponibles)"
      })
    },
    baseURL() {
      return '/admin/newsletters/' + this.$root.newsletterId + '/newsletter_sections/' + this.section.id
    }
  }
}
</script>

<style scoped>

  .library {
    margin-top: 20px;
  }

  .clear {
    clear: both;
  }

  .modal-body{
    height: 85%;
    overflow-y: auto;
  }

  .modal-dialog {
    margin-top: 17%;
    overflow-y: initial !important;
    width: 75%;
  }

  .modal-dialog .single-image{
    height: 250px;
  }

  .image-container {
    height: 200px;
    margin-bottom: 5px;
  }
  .modal-dialog img.section-img{
    max-height: 200px;
    width: 100%;
  }

  .thumbnail {
    max-width: 150px;
    max-height: 150px;
  }

  .modal-dialog .modal-content {
    min-height: 700px;
  }
  .add-button, .delete-button{
    display: block;
    width: 100%
  }
  .show-btn{
    margin-top: 10px;
  }
  .modal-footer {
    margin-top: 20px;
  }
</style>
