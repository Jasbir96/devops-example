import { render, screen, fireEvent } from '@testing-library/react';
import Counter from '../Counter';

describe('Counter Component', () => {
  test('renders counter with initial value of 0', () => {
    render(<Counter />);
    expect(screen.getByText('Counter: 0')).toBeInTheDocument();
  });

  test('increments counter when + button is clicked', () => {
    render(<Counter />);
    const incrementButton = screen.getByText('+');
    fireEvent.click(incrementButton);
    expect(screen.getByText('Counter: 1')).toBeInTheDocument();
  });

  test('decrements counter when - button is clicked', () => {
    render(<Counter />);
    const decrementButton = screen.getByText('-');
    fireEvent.click(decrementButton);
    expect(screen.getByText('Counter: -1')).toBeInTheDocument();
  });
});
