import React, { Component } from 'react';
import SlideshowList from './components/SlideshowList';
import Slideshow from './components/Slideshow';
import { BrowserRouter as Router, Route } from "react-router-dom";

import './App.css';
import SlideshowEdit from './components/SlideshowEdit';

class App extends Component {
  render() {
    return (
      <Router>
        <div>
          <Route path="/" exact component={SlideshowList} />
          <Route path="/slideshow/:id" component={Slideshow} />
          <Route path="/edit_slideshow/:id" component={SlideshowEdit} />
        </div>
      </Router>
    );
  }
}

export default App;
