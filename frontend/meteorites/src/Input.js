import React from "react";
import { FormControl } from "react-bootstrap";

const Input = props => {
  const { type, placeholder, name, required, disabled, componentClass } = props;

  return (
    <div>
      <FormControl
        type={type}
        placeholder={placeholder}
        name={name}
        required={required}
        disabled={disabled}
        componentClass={componentClass}
        {...props.input}
      />
    </div>
  );
};

export default Input;
