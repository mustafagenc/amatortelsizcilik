<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Icon extends Component
{
    /**
     * The icon type.
     *
     * @var string
     */
    public $type;

    /**
     * The icon color.
     *
     * @var string
     */
    public $fill;

    /**
     * Create the component instance.
     *
     * @param  string  $fill
     * @return void
     */
    public function __construct($type, $fill ="currentColor" )
    {
        $this->type = $type;
        $this->fill = $fill;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|string
     */
    public function render()
    {
        return view('components.icon');
    }

    // https://icons.getbootstrap.com/
}
