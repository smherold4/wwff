import React from 'react';
import ReactDOM from 'react-dom';

import LandingPage from './components/landing/LandingPage';

const components = {
  "LandingPage": <LandingPage/>
}

const components_by_klass = {}

function renderReactComponents() {
  
  for (let compId in components) {
    let rootEl = document.getElementById(compId);
    if (rootEl) {
      let props = $(rootEl).data();
      let componentWithProps = React.cloneElement(components[compId], props);
      ReactDOM.render(componentWithProps, rootEl);
    }
  }

  for (let compKlass in components_by_klass) {
    let els = document.getElementsByClassName(compKlass);

    if (els.length > 0) {
      for (let i = 0; i < els.length; i++) {
        let el = els[i];
        let props = $(el).data();
        let componentWithProps = React.cloneElement(components_by_klass[compKlass], props);
        ReactDOM.render(componentWithProps, el);
      }
    }
  }

}

document.addEventListener('DOMContentLoaded',() => {
  renderReactComponents()
});