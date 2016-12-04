<?php
class ControllerShippingCountryZone extends Controller {
    private $error; 
    
    public function index() {
        
        $this->load->language('shipping/country_zone');
        
        $this->load->model('setting/setting');
        $this->load->model('localisation/country');
        $this->load->model('localisation/tax_class');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('country_zone', $this->request->post);
            	
            $this->session->data['success'] = $this->language->get('text_success');
        
            $this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'));
        }
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $data['heading_title'] = $this->language->get('heading_title');
        
        $data['text_enabled']  = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none']     = $this->language->get('text_none');
        
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_first'] = $this->language->get('entry_first');
        $data['entry_next'] = $this->language->get('entry_next');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
        
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_add_geo_zone'] = $this->language->get('button_add_geo_zone');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        
        $data['action'] = $this->url->link('shipping/country_zone', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');
        
        $data['token'] = $this->session->data['token'];
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        
        $data['countries'] = $this->model_localisation_country->getCountries();
        $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
        
        $data['breadcrumbs'] = array();
        
        $data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_home'),
                'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
              	'separator' => false
        );
        
        $data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_shipping'),
                'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
              	'separator' => ' :: '
        );
        
        $data['breadcrumbs'][] = array(
                'text'      => $this->language->get('heading_title'),
                'href'      => $this->url->link('shipping/country_zone', 'token=' . $this->session->data['token'], 'SSL'),
              	'separator' => ' :: '
        );
        
        $postKeyArray = array('country_zone_status', 'country_zone_sort_order', 'country_zone_cost');
        foreach($postKeyArray as $key)
        {
            if (isset($this->request->post['country_zone_status'])) {
                $data[$key] = $this->request->post[$key];
            } else {
                $data[$key] = $this->config->get($key);
            }
        }
        
        /*$this->children = array(
                'common/header',
                'common/footer'
        );
        $this->template = 'shipping/country_zone.tpl';
        
        $this->response->setOutput($this->render());*/
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('shipping/country_zone.tpl', $data));
    }
    
    protected function validate() {
        if (!$this->user->hasPermission('modify', 'shipping/country_zone')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
    
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}